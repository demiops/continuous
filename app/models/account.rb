class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :clusters
    has_one  :cc
    has_one  :billing
    has_many :credentials
    validates :password, :email, presence: true
    validates :password, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" } 
    validates :email, uniqueness: true
 
    #def self.from_omniauth(auth)
    #where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
    #  user.provider = auth.provider
    #  user.uid = auth.uid
    #  user.name = auth.info.name
    #  user.email = auth.info.email
    #  user.image - auth.info.image
    #  user.oauth_refresh_token = auth.credentials.refresh_token if auth.credentials.refresh_token
    #  user.oauth_token = auth.credentials.token
    #  user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    #  user.save!
    #end
  #end

end
