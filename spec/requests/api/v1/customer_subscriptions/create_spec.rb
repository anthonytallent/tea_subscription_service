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
    )
    
    @cust_sub = CustomerSubscription.create(customer_id: @wonka.id, subscription_id: @subscription.id, frequency: 0)
  end
  describe "happy path" do
    it "can create a Customer Subscription" do
      customer_subscription_params = ({
        customer_id: @wonka.id,
        subscription_id: @subscription.id,
        frequency: 0
      })

      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/customer_subscriptions", headers: headers, params: JSON.generate(customer_subscription: customer_subscription_params)
      created_subscription = CustomerSubscription.last

      expect(response).to be_successful
      expect(created_subscription.customer_id).to eq(@wonka.id)
      expect(created_subscription.subscription_id).to eq(@subscription.id)

      rendered_response = JSON.parse(response.body, symbolize_names: true)
      expect(rendered_response).to have_key(:data)
      expect(rendered_response[:data]).to be_a(Hash)

      expect(rendered_response[:data]).to have_key(:id)
      expect(rendered_response[:data][:id]).to be_a(String)

      expect(rendered_response[:data]).to have_key(:type)
      expect(rendered_response[:data][:type]).to be_a(String)

      expect(rendered_response[:data]).to have_key(:attributes)
      expect(rendered_response[:data][:attributes]).to be_a(Hash)

      expect(rendered_response[:data][:attributes]).to have_key(:subscription_id)
      expect(rendered_response[:data][:attributes][:subscription_id]).to be_a(Integer)

      expect(rendered_response[:data][:attributes]).to have_key(:customer_id)
      expect(rendered_response[:data][:attributes][:customer_id]).to be_a(Integer)
    end
  end
end