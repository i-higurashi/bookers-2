Rails.application.routes.draw do
	devise_for :users
 	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 	resources :users, only: [:show, :edit, :update, :index]
	resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]

	get '/top' => 'tops#top'
	get '/show' => 'tops#show'
    root 'tops#top'
end
