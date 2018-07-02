Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: :registrations }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'

  resources :users do
    collection do
      get :experts
      post :update_experts
      get :profile
    end

    member do
      post :rating
    end
  end

  resources :experts, only: [:index, :show]
end
