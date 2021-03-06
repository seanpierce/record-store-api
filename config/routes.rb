Rails.application.routes.draw do
  devise_for :users
  resources :items
  # note: singular resource for sessions
  resource :sessions, only: [:create, :destroy, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
