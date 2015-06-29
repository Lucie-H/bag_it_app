Rails.application.routes.draw do

  devise_for :users

  root 'application#index'

  resources :bags do
  	resources :items
  end

  resources :bags

  resources :items do
  	get 'toggle_status', :on => :member
  end

  resources :bags do
		get 'weekend', on: :new
		get 'beach', on: :new
		get 'ski', on: :new
		get 'conference', on: :new
    get 'reset', :on => :member
	end

end
