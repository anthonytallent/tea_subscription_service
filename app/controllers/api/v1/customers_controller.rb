class Api::V1::CustomersController < ApplicationController
  def show
    options = { include: %i[subscriptions] }
    customer = Customer.find(params[:id])
    render json: CustomerSerializer.new(customer, options)
  end
  
end