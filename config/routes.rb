Rails.application.routes.draw do

  resources :photos
  resources :subscriptions
  resources :comments
  devise_for :users
  # корень сайта
  root "events#index"

  resources :events do
    resources :comments, only: [:create, :destroy]

    # вложенный ресурс подписок
    resources :subscriptions, only: [:create, :destroy]

    # Вложенные в ресурс события ресурсы фотографий
    resources :photos, only: [:create, :destroy]
  end
  
  resources :users, only: [:show, :edit, :update]  
end