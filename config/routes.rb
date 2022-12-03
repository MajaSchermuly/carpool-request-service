# frozen_string_literal: true

Rails.application.routes.draw do
  resources :cars
  resources :whitelists
  resources :drivers
  resources :ndrs

  root 'home#index'

  get 'ndrs', to: 'ndrs#index'

  # Manual Control of request button
  get '/button_control', to: 'ndrs#button_control'
  post '/disable_button', to: 'ndrs#disable_button'
  post '/enable_button', to: 'ndrs#enable_button'

  get 'history', to: 'history#index'
  get '/member/rider_info', to: 'member#rider_info'
  get 'no_ride_assigned', to: 'member#no_ride_assigned'
  get '/member/all_statuses', to: 'member#all_statuses'
  get '/member/overview', to: 'member#overview'
  get '/check_points', to: 'member#check_points', as: 'members_check_points'

  get '/incoming', to: 'requests#incoming', as: 'requests_incoming'
  get '/waiting', to: 'requests#waiting', as: 'requests_waiting'

  get '/riding', to: 'assignments#riding', as: 'assignments_riding'
  get '/done', to: 'assignments#done', as: 'assignments_done'
  get '/queue', to: 'assignments#queue', as: 'search'

  # Get Requests for NDR
  get '/car_list', to: 'cars#list', as: 'cars_list'
  get '/driver_list', to: 'drivers#list', as: 'drivers_list'
  get '/request_list', to: 'requests#list', as: 'requests_list'

  get '/checkin', to: 'drivers#checkin', as: 'drivers_checkin'
  post '/checkin', to: 'drivers#checkin_update', as: 'drivers_checkin_update'

  get '/doc', to: 'home#doc', as: 'home_doc'

  devise_for :members, controllers: {
    registrations: 'members/registrations',
    sessions: 'members/sessions',
    omniauth_callbacks: 'members/omniauth_callbacks'
  }

  resources :whitelists do
    post :remove_supervisor, on: :member
    get 'supervisor', to: 'whitelists#supervisor'
  end

  resources :member do
    post :update_supervisor, on: :member
    post :update_admin, on: :member
  end

  resources :ndrs do
    get 'join', to: 'drivers#join', as: 'join'
    post 'join', to: 'drivers#join_confirm', as: 'join_confirm_path'
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
    post 'join', to: 'drivers#join', as: 'drivers_join'
  end

  resources :drivers do
    post 'leave'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
