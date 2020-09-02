# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :admins
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :categories, only: [:show]
  resources :products, only: %i[index show]
  resource :cart, only: [:show] do
    put 'add/:product_id', to: 'carts#add', as: :add_to
    put 'remove/:product_id', to: 'carts#remove', as: :remove_from
    put 'remove_one/:product_id', to: 'carts#removeone', as: :remove_one
  end

  resources :transactions, only: [:new, :create]

  namespace :admin do
    root to: 'products#index'
    resources :products, only: %i[index new create edit update destroy]
    resources :categories, only: %i[index new create edit update destroy]
    resources :orders, only: [:index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
end
