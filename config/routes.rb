SquapeCom::Application.routes.draw do

  resources :publications


  devise_for :users

  devise_scope :user do
    get 'auth/registrar', to: 'devise/registrations#new', as: :registrar
    get 'auth/iniciar', to: 'devise/sessions#new', as: :login
    get 'auth/salir', to: 'devise/sessions#destroy', as: :logout
  end

  root :to => 'pages#home'

end
