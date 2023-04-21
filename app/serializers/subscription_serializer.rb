class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :title, :price
end