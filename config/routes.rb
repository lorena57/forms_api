Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do 

    namespace :v1 do

      resource :user, only: [:create]

      # resource :user

      post '/login', to: 'auth#login'

      get '/auto_login', to: 'auth#auto_login'

      get '/user_is_auth', to: 'auth#user_is_authed'

    end
  end
end
