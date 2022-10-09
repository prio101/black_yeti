# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'homes#index'


  namespace 'web' do
    namespace 'v1' do
      resources :services
      resources :bookings

      resources :users, only: [:index, :edit, :update]
    end
  end


  # api
  namespace 'api' do
    namespace 'v1' do
      resources :services, except: [ :new, :edit ]
      resources :bookings, except: [ :new, :edit ]
      resources :payments, except: [ :new, :edit ]
      resources :users, only: [ :index, :update ]
      scope :auths do
        post :login, to: 'auths#login'
        post :register, to: 'auths#register'
      end
    end
  end
end
