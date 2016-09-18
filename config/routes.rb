Rails.application.routes.draw do
  get 'messages/new'

  root 'static_pages#home'

  get '/about',	to: 'static_pages#about'

  get '/contact', to: 'static_pages#contact'

  get '/portfolio', to: 'static_pages#portfolio'
	
  #get '/messages', to: 'static_pages#messages'

  resources :messages, only: [:new, :create]
end
