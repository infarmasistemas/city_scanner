Rails.application.routes.draw do
  resources :contacts
  resources :logs
  get 'dashboard/index'
  resources :resources

  root to: 'dashboard#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
