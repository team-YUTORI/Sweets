Rails.application.routes.draw do


  devise_for :admins, controllers: {
    sessions:      'admins/sessions'
  }
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #管理者
  namespace :admins do
    resources :users, only: [:show, :index, :edit, :update]
    resources :items, only: [:show, :index, :new, :create, :edit, :update, :destroy]
    resources :orders, only: [:show, :index, :top]
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
   end
  # 顧客
  scope module: :customers do
    resources :users, only: [:show, :edit, :update, :destroy]
    resources :items, only: [:show, :index]
    resources :orders, only: [:show, :index]
    resources :delivery_addresses, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :carts_items, only: [:index, :update, :destroy]
    get 'homes/top' => 'homes#top'
    get 'thanks' => 'homes#thanks'
    get 'about' => 'homes#about'
    root 'homes#top'
  end
end
