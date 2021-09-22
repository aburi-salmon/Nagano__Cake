Rails.application.routes.draw do
  
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :members, controllers: {
    sessions:      'publics/sessions',
    passwords:     'publics/passwords',
    registrations: 'publics/registrations'
  }

  root to: 'publics/homes#top'
  get 'about' => 'publics/homes#about'
  get 'search' => 'searches#search'
  get 'members/confirm' => 'publics/members#confirm'
  patch 'members/withdraw' => 'publics/members#withdraw'
  post 'orders/confirm' => 'publics/orders#confirm'
  get 'orders/complete' => 'publics/orders#complete'
  resources :members, only: [:edit, :update, :show], module: :publics
  resources :addresses, only: [:index, :create, :edit, :update, :destroy], module: :publics
  
  scope module: :publics do
    resources :products, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :destroy, :edit, :update] do
      collection do
        delete 'destroy_all'
      end
    end
  end

  resources :orders, only: [:new, :create, :index, :show], module: :publics

  namespace :admins do
    resources :members, only: [:index, :edit, :update, :show]
    resources :products, except: [:destroy]
    resources :orders, only: [:show, :update] do
      resources :order_details, only: [:update]
    end
    resources :genres, only: [:index, :create, :edit, :update]
  end
end
