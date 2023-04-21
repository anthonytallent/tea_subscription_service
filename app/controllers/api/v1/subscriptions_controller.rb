class Api::V1::SubscriptionsController < ApplicationController
  def update
    cust_sub = CustomerSubscription.find_by(customer_id: params["customer_id"], subscription_id: params["subscription_id"])
    # subscription = cust_sub.subscription
    cust_sub.update(status: 1)
    render json: CustomerSubscriptionSerializer.new(cust_sub)
  end
end