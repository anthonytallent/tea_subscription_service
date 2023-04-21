class Api::V1::CustomerSubscriptionsController < ApplicationController
  def create
    options = { include: %i[customer subscription] }
    new_sub = CustomerSubscription.new(customer_id: params["customer_subscription"]["customer_id"], subscription_id: params["customer_subscription"]["subscription_id"])
    if new_sub.save
      render json: CustomerSubscriptionSerializer.new(new_sub, options)
    else
      render json: { "error": "bad request" }
    end
  end

  def update
    cust_sub = CustomerSubscription.find_by(customer_id: params["customer_id"], subscription_id: params["subscription_id"])
    # subscription = cust_sub.subscription
    cust_sub.update(status: 1)
    render json: CustomerSubscriptionSerializer.new(cust_sub)
  end

end