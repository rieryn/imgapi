Rails.application.routes.draw do
  resources :base64imgs,only: [:index, :show, :create]
  resources :img_items,only: [:index, :show, :create, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
