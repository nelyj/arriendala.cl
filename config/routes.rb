SquapeCom::Application.routes.draw do

  resources :publications


  devise_for :users
  root :to => 'pages#home'

end
