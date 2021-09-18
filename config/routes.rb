Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  
  devise_for :members
  root to: 'public/homes#top'
  get 'about' => 'public/homes#about'
  get 'search' => 'searches#search'
  get 'members/confirm' => 'members#confirm'
  patch 'menbers/withdraw' => 'members#withdraw'
  delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
  post 'orders/confirm' => 'orders#confirm'
  get 'orders/complete' => 'orders#complete'
  resources :members, only: [:edit, :update, :show]
  resources :addresses, only: [:index, :create, :edit, :update, :destroy]
  resources :products, only: [:index, :show] do
    resources :cart_items, only: [:index, :create, :destroy, :edit]
  end
  resources :orders, only: [:new, :create, :index, :show]
  namespace :admin do
    #root to: 'homes#top'
    resources :members, only: [:index, :edit, :update, :show]
    resources :products, except: [:destroy]
    resources :orders, only: [:show, :update] do
      resources :order_details, only: [:update]
    end
    resources :genres, only: [:index, :create, :edit, :update]
  end
end
