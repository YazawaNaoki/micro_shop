Rails.application.routes.draw do
  root 'products#index'
  devise_for :admins, controllers: { sessions: 'admins/sessions', passwords: 'admins/passwords', registrations: 'admins/registrations' }
  devise_for :users, controllers: { registrations: 'users/registrations' }

  namespace :admins do
    get 'making/home'
    resources :users do
      get 'alert'
      patch 'delete'
    end
    resources :products do
      resources :arrivals
    end
    get 'arrivals' => 'arrivals#index_all'
    resources :artists
    resources :labels
  end

  resources :users do
    resources :addresses
    get 'alert'
    patch 'delete'
  end

  resources :products

  resources :orders
  get 'orders/:id/done' => "orders#done", as: "order_done"

  resources :cart_items, only: [:index, :create, :destroy]
  get 'cart_items/confirm' => "cart_items#index_confirm", as: 'cart_items_confirm'
  post 'cart_items/:id/add' => "cart_items#add_quantity", as: 'cart_item_add'
  post 'cart_items/:id/reduce' => "cart_items#reduce_quantity", as: 'cart_item_reduce'

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
end
