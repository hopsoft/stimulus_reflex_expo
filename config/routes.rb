# frozen_string_literal: true

Rails.application.routes.draw do
  scope :demos do
    resource :book_search, only: [:show]
    resource :chat, only: [:show]
    resource :geo_selector, only: [:show]
    resource :gravatar, only: [:show]
    resource :reverse_text, only: [:show]
    resource :snake, only: [:show]
    resource :validation, only: [:show]
  end

  resources :users, only: [:create]
  resources :demos, only: [:index]
  root "demos#index"
end
