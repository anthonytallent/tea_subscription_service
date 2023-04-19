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

end