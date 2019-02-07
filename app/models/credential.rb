class Credential < ApplicationRecord
    belongs_to :account
    validates :cloudtype, inclusion: { in: %w(digitalocean aws azure gcp), message: "%{value} is not valid cloud, please specify digitalocen, aws, azure or gcp" }
    validates :cloudkey, :cloudsecret, presence: true
    
end
