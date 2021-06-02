Rails.application.routes.draw do
  get 'classroom/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :assignments, only: [:index, :show]

  resources :classroom, only: [:show] do
    resources :reviews, only: [:create]
  end
end
