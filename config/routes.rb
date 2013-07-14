Aces::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end

  namespace :admin do
    resources :pilots
    resources :tournaments

    get "/dashboard" => "dashboard#index"
    get "/" => "tournaments#index"
  end

  match '/admin/tournaments/pick_pilots/:id' => 'admin/tournaments#pick_pilots', as: 'pick_pilots'
  match '/admin/tournaments/shuffle/:id' => 'admin/tournaments#shuffle', as: 'shuffle'

  match '/admin/tournaments/add_pilot/:id' => 'admin/tournaments#add_pilot', as: 'add_pilot'
  match '/admin/tournaments/remove_pilot/:id' => 'admin/tournaments#remove_pilot', as: 'remove_pilot'

  root :to => "home#index"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users
end
