Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  get 'public_recipes', to: 'recipes#public_recipes'
  resources :recipes do
    resources :recipe_foods, only: [:new, :create, :destroy]
  end

  resources :foods, only: [:index, :new, :create, :destroy]

  patch '/recipes/:id/toggle_public', to: 'recipes#toggle_public', as: 'make_public'
end