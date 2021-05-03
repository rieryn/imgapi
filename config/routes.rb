Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  resources :image_files,only: [:index, :show, :create, :search, :destroy] do
    collection do
      post 'search'
    end
  end
  resources :base64imgs,only: [:index, :show, :create, :destroy]
  resources :img_items,only: [:index, :show, :create, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
