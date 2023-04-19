Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :customers, only: [:show]
      resources :subscriptions, only: [:update], controller: "subscriptions"
      resources :customer_subscriptions, only: [:create], controller: "customer_subscriptions"
    end
  end
  # post "/customer_subscriptions/:customer_id/:subscription_id", to: "customer_subscriptions#create"
end
