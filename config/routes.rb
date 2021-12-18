Rails.application.routes.draw do
  devise_for :admin, skip: [:passwords,:registrations], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :customers, skip: [:passwords,], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  namespace :admin do
    get 'homes' => 'homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    get 'orders/:id' => 'orders#show'
    patch 'orders/:id' => 'orders#update'
    patch 'order_details/:id' => 'order_details#update'
  end
  
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :items, only: [:index, :show]
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'
    resources :customers, only: [:show, :edit, :update]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :update, :destroy, :create]
    post 'orders/comfirm' => 'orders#comfirm'
    get 'orders/thanks' => 'orders#thanks'
    resources :orders, only: [:new, :create, :index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end
end
