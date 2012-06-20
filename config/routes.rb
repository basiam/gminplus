Gmina::Application.routes.draw do
  resources :interests, only: [:new, :create, :update]
  namespace :admin do
    resources :interests
  end
end
