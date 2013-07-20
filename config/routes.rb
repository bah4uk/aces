Aces::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end

  namespace :admin do
    resources :pilots
    resources :tournaments
    resources :wstats
    resources :wwstats

    get "/dashboard" => "dashboard#index"
    get "/" => "tournaments#index"
  end

  resources :tournaments do
    get "/overall" => "tournaments#overall"
  end

  match '/admin/tournaments/pick_pilots/:id' => 'admin/tournaments#pick_pilots', as: 'pick_pilots'
  match '/admin/tournaments/shuffle/:id' => 'admin/tournaments#shuffle', as: 'shuffle'

  match '/admin/tournaments/pick_for_tour/:id' => 'admin/tournaments#pick_for_tour', as: 'pick_for_tour'
  match '/admin/tournaments/add_to_tour/:id' => 'admin/tournaments#add_to_tour', as: 'add_to_tour'
  match '/admin/tournaments/remove_from_tour/:id' => 'admin/tournaments#remove_from_tour', as: 'remove_from_tour'

  match '/admin/tournaments/add_pilot/:id' => 'admin/tournaments#add_pilot', as: 'add_pilot'
  match '/admin/tournaments/remove_pilot/:id' => 'admin/tournaments#remove_pilot', as: 'remove_pilot'

  root :to => "home#index"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users
end
