# frozen_string_literal: true

Rails.application.routes.draw do
  resources :cars
  resources :whitelists
  resources :drivers
  resources :ndrs

  root 'home#index'

  get 'ndrs', to: 'ndrs#index'

  get 'history', to: 'history#index'
  get '/member/rider_info', to: 'member#rider_info'
  get '/member/all_statuses', to: 'member#all_statuses'

  get '/incoming', to: 'requests#incoming', as: 'requests_incoming'
  get '/waiting', to: 'requests#waiting', as: 'requests_waiting'

  get '/riding', to: 'assignments#riding', as: 'assignments_riding'
  get '/done', to: 'assignments#done', as: 'assignments_done'
  get '/queue', to: 'assignments#queue', as: 'search'

  get '/checkin', to: 'drivers#checkin', as: 'drivers_checkin'

  devise_for :members, controllers: {
    registrations: 'members/registrations',
    sessions: 'members/sessions',
    omniauth_callbacks: 'members/omniauth_callbacks'
  }

  resources :whitelists
  resources :drivers

  resources :drivers do
    post 'join', to: 'drivers#join_request', as: 'join_request'
  end

  # for end product, index and show not being used (so disable later on)
  resources :requests do
    # pages handling buttons or actions (at the moment, status isn't used)
    get 'status'
    post 'done'
    post 'cancel'

    get 'assign', to: 'assignments#assign', as: 'assign'
    post 'assign', to: 'assignments#create', as: 'create_assignment'
  end
  # post 'requests/:request_id/assign', to: 'assignments#create', as: 'create_assignment'

  # for end product, index and show not being used (so disable later on)
  resources :assignments do
    # pages handling buttons or actions
    post 'dropped_off'
  end

  resources :ndrs do
    post 'join', to: 'drivers#create', as: 'create_assignment'
  end

  resources :ndrs do
    post 'join', to: 'drivers#create', as: 'create_assignment'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
