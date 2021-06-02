Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :assignments, only: [:index, :show] do
    get "teacher_proposals", on: :member
  end

  resources :classroom, only: [:show] do
    resources :reviews, only: [:create]
  end

  resources :users, only: :index
end
