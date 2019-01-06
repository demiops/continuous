class Account < ApplicationRecord
    has_many :clusters
    has_one  :cc
    has_one  :billing
    has_many :credentials
end
