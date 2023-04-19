require 'rails_helper'

RSpec.describe "Customer Subscriptions Create" do
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
  end
  describe "happy path" do
    it "can create a Customer Subscription" do
      customer_subscription_params = ({
        customer_id: @wonka.id,
        subscription_id: @subscription.id
      })

      headers = {"CONTENT_TYPE" => "application/json"}

      post "/customer_subscriptions", headers: headers, params: JSON.generate(customer_subscription: customer_subscription_params)
      created_subscription = CustomerSubscription.last

      expect(response).to be_successful
      expect(created_subscription.customer_id).to eq(@wonka.id)
      expect(created_subscription.subscription_id).to eq(@subscription.id)
    end
  end
end