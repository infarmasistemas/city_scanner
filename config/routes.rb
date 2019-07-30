Rails.application.routes.draw do
  resources :resources

  root to: "home#index"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
