SquapeCom::Application.routes.draw do

  resources :publicaciones, :controller => "publications"
  resources :perfil, :controller=> "profile"
  devise_for :users

  devise_scope :user do
    get 'auth/registrar', to: 'devise/registrations#new', as: :registrar
    get 'auth/iniciar', to: 'devise/sessions#new', as: :login
    get 'auth/salir', to: 'devise/sessions#destroy', as: :logout
  end

  root :to => 'pages#home'

  match '/dashboard', :to => 'publications#show', :as => :dashboard
  match '/informacion/perfil', :to => 'profile#informacion', :as => :perfil_informacion

end
