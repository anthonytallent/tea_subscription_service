class CustomerSubscription < ApplicationRecord
  belongs_to :customer
  belongs_to :subscription

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