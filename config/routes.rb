# frozen_string_literal: true

Rails.application.routes.draw do
  scope :demos do
    resource :book_search, only: [:show]
    resource :calendar, only: [:show], path: '/calendar/:date'
    resources :calendar_events, only: %i[create update]
    resource :chat, only: [:show]
    resource :geo_selector, only: [:show]
    resource :gravatar, only: [:show]
    resource :permalink, only: [:show]
    resource :reverse_text, only: [:show]
    resource :snake, only: [:show]
    resource :tabular, only: [:show]
    resource :time_series, only: [:show]
    resource :timers, only: [:show]
    resource :todo, only: [:show]
    resource :validation, only: [:show]
  end

  resources :demos, only: [:index]
  root 'demos#index'
end
