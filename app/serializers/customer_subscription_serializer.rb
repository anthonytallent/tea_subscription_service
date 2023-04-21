class CustomerSubscriptionSerializer
  include JSONAPI::Serializer
  attributes :customer_id, :subscription_id, :status, :frequency
  belongs_to :customer
  belongs_to :subscription
end