Rails.application.routes.draw do
  get 'messages/new'

  root 'static_pages#home'

  get '/about',	to: 'static_pages#about'

  get '/contact', to: 'static_pages#contact'

  #get '/portfolio', to: 'static_pages#portfolio'
	
  #get '/form', to: 'static_pages#form'


  resources :messages, only: [:new, :create]
end
