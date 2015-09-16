Rails.application.routes.draw do
  get 'sellers/new'

  get 'sellers/edit'

  get 'customers/new'

  get 'customers/edit'

  get 'customers/new'

  get 'customers/edit'

  resources :goods
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
  get 'filldata' => 'customers#new'
  get 'editdata' => 'customers#edit'
  get 'profile' => 'users#show'
  
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :customers, only: [:new, :create, :edit, :update]

end
