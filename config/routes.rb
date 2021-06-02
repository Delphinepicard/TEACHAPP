Rails.application.routes.draw do
  get 'assignments/index'
  get 'assignments/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :assignments, only: [:index, :show] do
    get "accept", on: :member
  end
end
