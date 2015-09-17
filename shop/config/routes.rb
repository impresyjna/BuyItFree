Rails.application.routes.draw do
  get 'sessions/new'

  root             'static_pages#home'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'rules'   => 'static_pages#rules'
  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'users'   => 'users#index'
  get 'customer_create' => 'customers#new'
  get 'customer_account' => 'customers#edit'
  get 'profile' => 'users#show'
  get 'seller_create' => 'sellers#new'
  get 'seller_account' => 'sellers#edit'
  
  
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :customers, only: [:new, :create, :edit, :update]
  resources :categories
  resources :sellers, only:[:new, :create, :edit, :update]
  resources :goods

end
