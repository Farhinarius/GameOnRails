Rails.application.routes.draw do
  # --------------------------- Работа с страницами --------------------------- #
  get 'pages/index'
  get 'pages/game1'
  get 'pages/game2'
  get 'pages/game3'
  get 'users/new'
  get 'sessions/new'
  
  # ------------------------- Работа с пользователями ------------------------- #
  # Вход
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  # Выход
  get '/logout' => 'session#destroy'

  # Регистрация
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  # --------------------------- Маршруты по умолчанию ------------------------- #
  root 'pages#index'
    
  resources :comments
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
