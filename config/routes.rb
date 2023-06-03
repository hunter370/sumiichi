Rails.application.routes.draw do
  scope module: :user do
    root to: "homes#top"
    get '/about' => 'homes#about', as: 'about'
  end
  namespace :admin do
    root to: "homes#top"
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
