Rails.application.routes.draw do
  get 'admin/tournament_teams'
  scope module: :user do
    root to: "homes#top"
    get '/about' => 'homes#about', as: 'about'
    get 'users/my_page' => 'users#show', as: 'users/show'
    get 'users/my_page/edit' => 'users#edit', as: 'users/edit'
    patch 'users/my_page' => 'users#update', as: 'users/update'
    get 'users/unsubscribe'
    patch 'users/withdraw' => 'users#withdraw', as: 'users/withdraw'
    resources :games, only: [:index, :show]
  end
  namespace :admin do
    root to: "homes#top"
    resources :tournaments, only: [:new, :create, :index, :edit, :update, :show]
    resources :teams, only: [:create, :index, :show, :edit, :update]
    resources :games, only: [:create, :index, :show, :edit, :update]
    resources :users, only: [:index, :show]
  end
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
