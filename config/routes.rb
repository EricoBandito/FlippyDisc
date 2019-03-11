Rails.application.routes.draw do
  get 'discs/index'
  get 'discs/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "discs#index"
end
