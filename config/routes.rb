Rails.application.routes.draw do
  root :to => 'home#index'

  get '/home/index',:to => 'home#index'
  get 'home/authentication'
  post '/home/guest_sign_in', :to => 'homes#new_guest'
  
  resources :golfcourses, only: [:new]
  post 'golfcourses/create', :to => 'golfcourses#create' ,:as => 'round_start'
  
  
  get 'score/index'
  resources :scores, only: [:show]

  get 'plays/update'
  
  get '/plays/:score_id/:hole_number', :to => 'plays#edit' ,:as => 'plays_edit'
  resources :plays, only: [:update]
  
  resources :publisheds, only: [:update]
  resources :unpublisheds, only: [:update]
  
  #◇「過去のスコアを見る」まわりのルーティング
  resources :archives, only: [:index, :show, :edit]
  post 'archives/:id', to: 'archives#update' ,:as => 'archives_update'
  delete 'archives/:id',:to => 'archives#destroy' ,:as => 'archives_destroy'

  #◇「掲示板を覗く」まわりのルーティング
  resources :messages, only: [:index, :show, :create, :destroy]
  get '/messages/index/:golfcourse_id', :to => 'messages#index_course' ,:as => 'messages_index_course'
  
  #◇いいね機能のルーティング
  resources :likes, :only => [:create, :destroy]
  
  #◇mypageまわりのルーティング
  resources :mypages, :only => [:index, :edit, :update]

  #◇deviseまわりのルーティング
  get '/users/index',:to => 'users#index' ,:as => 'user_index'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  }
  get 'users/show'

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
