Aces::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end

  namespace :admin do
    resources :pilots
    resources :tournaments

    get "/" => "dashboard#index"
  end

  root :to => "home#index"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users
end
