Rails.application.routes.draw do
  resources :ajax, only: [:index]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :discs, only: [:index, :show] do
    member do
      post :add_to_cart
      get :cart
    end
  end

  get '/cart-items', to: 'cart_items#index'
  post '/cart-items/clear', to: 'cart_items#clear'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "discs#index"
end
