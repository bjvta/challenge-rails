# frozen_string_literal: true

Rails.application.routes.draw do
  resources :repositories
  resources :profiles
  root 'home#index'
  get 'reports', to: 'reports#index'
end
