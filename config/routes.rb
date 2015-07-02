Rails.application.routes.draw do

  devise_for :users

  root 'application#index'

  resources :bags do
  	resources :items do
      get 'shampoo', on: :new
      get 'new_select', on: :new
    end
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
    get 'city', on: :new
    get 'reset', :on => :member
    get 'duplicate', :on => :member
	end

end
