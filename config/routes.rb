Rails.application.routes.draw do
  # get 'sessions/new'

  # get 'users/new'
  root 'static_page#home'
  get '/help', to: 'static_page#help'
  get '/about', to: 'static_page#about'
  get '/contact', to: 'static_page#contact'
  get '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'
  get '/login', to: 'sessions#new' #loginページを表示 
  # HTTPのGETメソッドのURLリクエストがあったときには、sessionsのnewアクションへ飛ばすッて意味
  post '/login', to: 'sessions#create' #loginするとき
  delete '/logout', to: 'sessions#destroy' #ログアウトするとき

  resources :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
