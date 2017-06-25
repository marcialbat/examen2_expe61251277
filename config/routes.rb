
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root 'home#index'

  resources :autors do
      member do
        get :book
      end
  end

  resources :books do
    resources :orders
  end

  get "/login" => "sessions#new", as: "login"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"
end
