require 'rails_helper'

RSpec.describe "Customer Requests" do
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

  describe "happy path" do
    it "will return all of the customers information including their subscrtiptions" do
      headers = {"CONTENT_TYPE" => "application/json"}

      get "/api/v1/customers/#{@wonka.id}", headers: headers, params: JSON.generate(@wonka)

      expect(response).to be_successful
    end
  end
end