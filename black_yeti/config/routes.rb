# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'homes#index'

  # api
  namespace 'api' do
    namespace 'v1' do
      resources :services, only: [:index]
    end
  end
end
