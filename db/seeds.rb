require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
SubscriptionTea.destroy_all
CustomerSubscription.destroy_all
Tea.destroy_all
Subscription.destroy_all
Customer.destroy_all

wonka = Customer.create(
  first_name: "Willy",
  last_name: "Wonka",
  email: "wonka@gmail.com",
  address: "123 WW Lane Denver CO, 57832"
)

subscription = Subscription.create(
  title: "3 For 50%",
  price: 20.55,
  frequency: 0
)

CustomerSubscription.create(customer_id: wonka.id, subscription_id: subscription.id)

tea1 = Tea.create(title: "black", description: "black tea", temperature: "90", brew_time: 10)
tea2 = Tea.create(title: "green", description: "green tea", temperature: "90", brew_time: 10)
tea3 = Tea.create(title: "herbal blend", description: "herbal blend tea", temperature: "90", brew_time: 10)

SubscriptionTea.create(subscription_id: subscription.id, tea_id: tea1.id)
SubscriptionTea.create(subscription_id: subscription.id, tea_id: tea2.id)
SubscriptionTea.create(subscription_id: subscription.id, tea_id: tea3.id)
