Rails.application.routes.draw do

  devise_for :users
	resources :books
	root "books#top"
  	root 'users#show'
  	get '/top' => "books#top"
	get'/about' => 'users#about'

	resources :users, only: [:show,:edit,:index,:destroy,:update]
	resources :post_images, only: [:new, :create, :index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
