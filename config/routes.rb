Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index', as: :hello_world

  resources :positions, only: [:index]

  namespace :api do
    resources :positions, only: [:create, :update, :delete]
  end
end
