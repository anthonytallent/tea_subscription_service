class Api::V1::SubscriptionsController < ApplicationController
  def update
    cust_sub = CustomerSubscription.find_by(customer_id: params["customer_id"], subscription_id: params["subscription_id"])
    subscription = cust_sub.subscription
    subscription.update(status: 1)
    render json: SubscriptionSerializer.new(subscription)
  end
end