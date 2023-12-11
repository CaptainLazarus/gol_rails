# frozen_string_literal: true

Rails.application.routes.draw do
  root 'games#index'

  resources :games, only: [:index] do
    post 'play', on: :collection
    post 'reset', on: :collection
  end
end
