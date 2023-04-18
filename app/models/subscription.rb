class Subscription < ApplicationRecord
  belongs_to :customer
  has_many :subscription_teas
end