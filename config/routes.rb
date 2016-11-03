Rails.application.routes.draw do

  resources :tags, only: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  # get "/" => 'home#index', as: :home


  get "/about" => 'home#about'
  get "/contact" => 'home#contact'
  post "/contact_submit" => 'home#contact_submit'

  #
  # get "/products/new" => 'products#new', as: :new_product
  #
  # post "/products" => 'products#create', as: :products
  #
  # get "/products/:id" => 'products#show', as: :product
  #
  # get "/products" => 'products#index'
  #
  # get '/products/:id/edit' => 'products#edit', as: :edit_product
  #
  # patch '/products/:id' => 'products#update'
  #
  # delete 'products/:id' => 'products#destroy'

root 'home#index'

resources :users, only: [:new, :create]

resources :sessions, only: [:new, :create, :destroy] do
  delete :destroy, on: :collection #this skips having an :id in the url
end

  resources :products, shallow: true do
    resources :favourites, only: [:create, :destroy]
    resources :reviews do
      resources :likes, only: [:create, :destroy]
    end
  end
  resources :favourites, only: [:index]
end
