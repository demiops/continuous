class Billing < ApplicationRecord
  belongs_to :account
  validates :firstname, :lastname, :address, :phone, :city, :state, :country, :email, presence: true
  validates :email, uniqueness: true
end
