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
    resources :users, only: [:show, :index, :edit, :update, :destroy]
    resources :items, only: [:show, :index, :new, :create, :edit, :update, :destroy]
    resources :orders, only: [:show, :index] do
      collection do
        get 'top'
      end
    end
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
   end
  # 顧客

   scope module: :customers do
    resources :users, only: [:show, :edit, :update, :destroy]
    get 'withdraw_top/:id' => 'users#withdraw_top' ,as: "user_withdrew" 
    resources :items, only: [:show, :index]
    get 'items/genre/:id' => 'items#index', as: "items_genre"
    resources :orders, only: [:show, :index]
    resources :delivery_addresses, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :carts_items, only: [:show, :update, :destroy]
    get 'homes/top' => 'homes#top'
    get 'thanks' => 'homes#thanks'
    get 'about' => 'homes#about'
    root 'homes#top'
   end
end
