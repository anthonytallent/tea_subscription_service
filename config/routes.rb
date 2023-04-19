Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

      resources :customer_subscriptions, only: [:create]
  # post "/customer_subscriptions/:customer_id/:subscription_id", to: "customer_subscriptions#create"
end
