# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'homes#index'

  # api
  namespace 'api' do
    namespace 'v1' do
      resources :services, except: [ :new, :edit ]
      resources :bookings, except: [ :new, :edit ]
      resources :payments, except: [ :new, :edit ]
      resources :users, only: [ :index, :update ]
    end
  end
end
