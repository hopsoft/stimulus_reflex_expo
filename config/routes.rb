# frozen_string_literal: true

Rails.application.routes.draw do
  resources :demos, only: [:index, :show]
  root "demos#index"
end
