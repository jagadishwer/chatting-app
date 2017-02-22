Rails.application.routes.draw do
  devise_for :logins
  mount ActionCable.server => '/cable/:user_id'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :messages, :accounts

  root to:"accounts#index"
end
