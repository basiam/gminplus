Gmina::Application.routes.draw do
  resources :interests, only: [:new, :create, :update]
  resources :communes, only: [:index]
  namespace :admin do
    resources :interests
  end
end
