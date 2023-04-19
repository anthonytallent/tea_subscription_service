class CustomerSubscriptionsController < ApplicationController
  def create
    CustomerSubscription.create(customer_id: params["customer_subscription"]["customer_id"], subscription_id: params["customer_subscription"]["subscription_id"])
  end
end