class Cc < ApplicationRecord
    belongs_to :account
    validates :ccnumber, :ccv, numericality: { only_integer: true }
    validates :ccnumber, :ccname, :ccexp, :ccv, presence: true
    validates :ccname, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
end
