# frozen_string_literal: true


  root 'requests#index'
  devise_for :members, controllers: {
     registrations:'members/registrations',
     sessions: 'members/sessions',
     omniauth_callbacks: 'members/omniauth_callbacks'
    }
  

  resources :requests do
    get 'cancel'
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
