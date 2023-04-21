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
    )
    
    @cust_sub = CustomerSubscription.create(customer_id: @wonka.id, subscription_id: @subscription.id, frequency: 0)
  end
  it "can update it's status" do
    previous_status = @cust_sub.status
    customer_subscription_params = ({
      customer_id: @wonka.id,
      subscription_id: @subscription.id
    })
    headers = {"CONTENT_TYPE" => "application/json"}

    patch "/api/v1/customer_subscriptions/#{@cust_sub.id}", headers: headers, params: JSON.generate(customer_subscription_params)
    updated_subscription = CustomerSubscription.last
    expect(response).to be_successful
    expect(@cust_sub.status).to_not eq(updated_subscription.status)
    expect(updated_subscription.status).to eq("cancelled")
  end
end