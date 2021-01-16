Rails.application.routes.draw do
  root :to => 'home#index'
  get 'users/show'
  get '/home/index',:to => 'home#index'
  get 'home/authentication'
  post '/home/guest_sign_in', :to => 'homes#new_guest'
  
  get 'golfcourses/get', :to => 'golfcourses#get'
  get 'golfcourses/search', :to => 'golfcourses#search'
  post 'golfcourses/round_start', :to => 'golfcourses#round_start' ,:as => 'round_start'
  get 'golfcourses/play/:id', :to => 'golfcourses#play' ,:as => 'golfcourse_play'
  # post 'golfcourses/:id', :to => 'golfcourses#update' ,:as => 'golfcourses_update'
  post 'golfcourses/finish/:id', :to => 'golfcourses#finish' ,:as => 'golfcourses_finish'
  # post '/golfcourses/message_create', :to => 'golfcourses#message_create' ,:as => 'golfcourses_message_create'

  #◇「過去のスコアを見る」まわりのルーティング
  get 'archives',:to => 'archives#index' ,:as => 'archives_index'
  get 'archives/:id', to: 'archives#show' ,:as => 'archives_show'
  get 'archives/:id/edit', to: 'archives#edit' ,:as => 'archives_edit'
  post 'archives/:id', to: 'archives#update' ,:as => 'archives_update'
  delete 'archives/:id',:to => 'archives#destroy' ,:as => 'archives_destroy'
  post 'archives/published/:id', to: 'archives#score_published' ,:as => 'archives_score_published'
  post 'archives/unpublished/:id', to: 'archives#score_unpublished' ,:as => 'archives_score_unpublished'
  
  #◇「掲示板を覗く」まわりのルーティング
  resources :messages, only: [:create]

  get '/messages/index',:to => 'messages#index' ,:as => 'messages_index'
  get '/messages/index/:golfcourse_id', :to => 'messages#index_course' ,:as => 'messages_index_course'
  get '/messages/:id', :to => 'messages#show'
  # post '/messages', :to => 'messages#create' ,:as => 'messages_create'
  
  #◇いいね機能のルーティング
  resources :likes, :only => [:create, :destroy]
  
  #◇mypageまわりのルーティング
  get '/mypages/index',:to => 'mypages#index' ,:as => 'mypage'
  get '/mypages/edit',:to => 'mypages#edit' ,:as => 'mypage_edit'
  put '/mypages' ,:to => 'messages#update' ,:as => 'mypage_update'

  #◇deviseまわりのルーティング
  get '/users/index',:to => 'users#index' ,:as => 'user_index'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 
  get '/users/show/:id/:round_id', :to => 'users#scorecard' ,:as => 'user_scorecard'
  devise_scope :user do
    get 'sign_in', :to => 'users/sessions#new'
    get '/users/sign_out', :to => 'users/sessions#destroy' 
    post 'users/guest_sign_in', :to => 'users/sessions#new_guest'
  end
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, :only => [:create, :destroy]


end
