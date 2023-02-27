Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :books
  resources :users do
    member do
      post :follow
      delete :unfollow
    end
  end
    # Defines the root path route ("/")
  # root "articles#index"
end
