class CreateClusterJob < ApplicationJob
  queue_as :default

  def perform(cluster)
    # Do something later
    cluster.createContinuousStack 
  end
end
