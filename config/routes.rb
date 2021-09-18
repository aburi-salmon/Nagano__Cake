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
  
  root to: 'public/homes#top'
  get 'about' => 'public/homes#about'
  get 'search' => 'searches#search'
  get 'members/confirm' => 'members#confirm'
  patch 'menbers/withdraw' => 'members#withdraw'
  delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
  post 'orders/confirm' => 'orders#confirm'
  get 'orders/complete' => 'orders#complete'
  resources :members, only: [:edit, :update, :show], module: :publics
  resources :addresses, only: [:index, :create, :edit, :update, :destroy]
  resources :products, only: [:index, :show], mudule: :publics do
    resources :cart_items, only: [:index, :create, :destroy, :edit]
  end
  resources :orders, only: [:new, :create, :index, :show]
  end
  namespace :admin do
    resources :members, only: [:index, :edit, :update, :show]
    resources :products, except: [:destroy]
    resources :orders, only: [:show, :update] do
      resources :order_details, only: [:update]
    end
    resources :genres, only: [:index, :create, :edit, :update]
  end
end
