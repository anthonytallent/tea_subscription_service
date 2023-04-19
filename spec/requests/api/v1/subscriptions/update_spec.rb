require 'rails_helper'

RSpec.describe "Subscription Requests" do
  before :each do
    @wonka = Customer.create(
      first_name: "Willy",
      last_name: "Wonka",
      email: "wonka@gmail.com",
      address: "123 WW Lane Denver CO, 57832"
    )
    
    @subscription = Subscription.create(
      title: "3 For 50%",
      price: 20.55,
      frequency: 0
    )
    
    CustomerSubscription.create(customer_id: @wonka.id, subscription_id: @subscription.id)
  end
  it "can update it's status" do
    previous_status = @subscription.status
    customer_subscription_params = ({
      customer_id: @wonka.id,
      subscription_id: @subscription.id
    })
    headers = {"CONTENT_TYPE" => "application/json"}

    patch "/api/v1/subscriptions/#{@subscription.id}", headers: headers, params: JSON.generate(customer_subscription_params)
    updated_subscription = Subscription.last
    expect(response).to be_successful
    expect(@subscription.status).to_not eq(updated_subscription.status)
    expect(updated_subscription.status).to eq("cancelled")
  end
end