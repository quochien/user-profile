Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'

  resources :users do
    collection do
      get :experts
      post :update_experts
    end
  end

  resources :experts, only: [:index, :show]
end
