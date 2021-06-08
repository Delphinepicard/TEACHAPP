Rails.application.routes.draw do
  devise_for :users
  root to: 'assignments#rectorat_index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :assignments, only: [:index, :show] do
    get "teacher_proposals", on: :member
    post "affect", on: :member
    get "accept", on: :member
  end

  get 'rectorat/assignments/', to: 'assignments#rectorat_index'
  
  resources :classroom, only: [:show] do
    resources :reviews, only: [:create]
  end

  resources :users, only: :index
end
