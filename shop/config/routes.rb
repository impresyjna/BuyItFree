Rails.application.routes.draw do
  resources :categories
  get 'sessions/new'

  get 'users/new'

  root             'static_pages#home'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'rules'   => 'static_pages#rules'
  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'users'   => 'users#index'
  
  resources :users
  resources :goods
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

end
