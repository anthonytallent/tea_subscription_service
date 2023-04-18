class Subscription < ApplicationRecord
  has_many :subscription_teas
  has_many :customer_subscriptions
  has_many :customers, through: :customer_subscriptions

  enum status: { 
    active: 0,
    cancelled: 1
  }

  enum frequency: {
    weekly: 0,
    biweekly: 1,
    monthly: 2
  }
end