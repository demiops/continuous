class Cluster < ApplicationRecord
  belongs_to :account
  validates :clustername, :clusterendpoints, :clusterstatus, :clusterusername, :clusterpassword, presence: true
  #validates :clusterstatus, inclusion: { in: %w(online offline creating destroying error), message: "%{value} is not a valid size" }

  before_create :setCreateStatus

  attr_accessor :cloudformation
  attr_accessor :ec2

  def setCreateStatus
    self.clusterstatus = "Requesting"
  end

  def createContinuousStack
    setEc2
    kp = self.ec2.create_key_pair({
      key_name: "#{self.clustername}-continuous-key"
    })
    self.clusterendpoints = kp.key_material
    setCloudformation
    self.cloudformation.create_stack({
      stack_name: self.clustername,
      template_url: "https://s3-us-west-2.amazonaws.com/demiops/continuous/continuous-small.json",
      parameters: [
        {
          parameter_key: "KeyName",
          parameter_value: "#{self.clustername}-continuous-key",
          use_previous_value: false,
        },
        {
          parameter_key: "Password",
          parameter_value: "password",
          use_previous_value: false
        },
      ],
      timeout_in_minutes: 20,
      capabilities: ["CAPABILITY_IAM"],
      on_failure: "DO_NOTHING", # accepts DO_NOTHING, ROLLBACK, DELETE
      tags: [
        {
          key: "Name",
          value: self.clustername,
        },
      ],
    })
  end

  def destroyContinuousStack
    puts 'Destroying Continuous Stack'
    setEc2
    self.ec2.delete_key_pair({
      key_name: "#{self.clustername}-continuous-key"
    })
    setCloudformation
    resp = self.cloudformation.delete_stack({
      stack_name: self.clustername
    })
    self.destroy
  end

  def updateContinuousStack
    setCloudformation
    resp = self.cloudformation.update_stack({

    })
  end

  def getContinuousStack
    puts 'Getting Continuous Stack status'
    setCloudformation
    resp = self.cloudformation.describe_stacks({
      stack_name: self.clustername
    })
    self.clusterstatus = resp.stacks[0].stack_status
    self.save
  end

  def self.getContinuousStack
    getContinuousStack
  end

private

  def setEc2
    self.ec2 = Aws::EC2::Client.new(
    region: 'us-west-2',
    access_key_id: "",
    secret_access_key: ""
    )
  end

  def setCloudformation
    self.cloudformation = Aws::CloudFormation::Client.new(
    region: 'us-west-2',
    access_key_id: "",
    secret_access_key: ""
    )
  end
    ###access_key_id: ENV[''],
    ###secret_access_key: ENV['']

end
