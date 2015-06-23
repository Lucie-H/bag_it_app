Rails.application.routes.draw do

  devise_for :users

  root 'application#index'

  resources :bags

end
