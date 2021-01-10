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
  post 'golfcourses/:id', to: 'golfcourses#update' ,:as => 'golfcourses_update'
  post 'golfcourses/finish/:id', to: 'golfcourses#finish' ,:as => 'golfcourses_finish'

  #◇「ラウンドする」まわりのルーティング
  get '/rounds/select_course', :to => 'rounds#select_course' ,:as => 'select_course'
    #フォームを表示するview
    # @todoufukens はselect_courseアクションで定義
  post '/rounds/search', :to => 'rounds#search'
    #ゴルフ場検索結果を表示するページ
  # get '/rounds/search/:course', :to => 'rounds#show' ,:as => 'round_start'
  get '/rounds/play/:course/:round_id', :to => 'rounds#play' ,:as => 'round_play'
  post '/rounds/play/:course/:round_id', :to => 'rounds#message_post' ,:as => 'round_message_post'
  get 'rounds/input/:round_id/:hole_number',:to => 'rounds#input' ,:as => 'hole_score_input'
  post 'rounds/input/:round_id/:hole_number',:to => 'rounds#update' ,:as => 'hole_score_new'


  #◇「過去のスコアを見る」まわりのルーティング
  get 'archives',:to => 'archives#index' ,:as => 'archives_index'
  get 'archives/:id', to: 'archives#show' ,:as => 'archives_show'
  get 'archives/:id/edit', to: 'archives#edit' ,:as => 'archives_edit'
  post 'archives/:id', to: 'archives#update' ,:as => 'archives_update'
  delete 'archives/:id',:to => 'archives#destroy' ,:as => 'archives_destroy'
  post 'archives/published/:id', to: 'archives#score_published' ,:as => 'archives_score_published'
  post 'archives/unpublished/:id', to: 'archives#score_unpublished' ,:as => 'archives_score_unpublished'
  
  # get 'archives/show/:round_id',:to => 'archives#show' ,:as => 'score_card'
  # get 'archives/edit/:round_id',:to => 'archives#edit' ,:as => 'scorecard_edit'

  # get 'archives/edit/:round_id/:hole_number',:to => 'archives#edit_score' ,:as => 'edit_hole_score'
  # get 'archives/edit_score/:round_id/:hole_number',:to => 'archives#hole_score_edit' ,:as => 'score_update'  
  # post 'archives/edit/:round_id/:hole_number',:to => 'archives#update' ,:as => 'hole_score_update'


  #◇「掲示板を覗く」まわりのルーティング
  get '/messages/index',:to => 'messages#index' ,:as => 'messages_index'
  get '/messages/index/:golfcourse_id', :to => 'messages#index_course' ,:as => 'messages_index_course'
  get '/messages/show/:golfcourse_id', :to => 'messages#show' ,:as => 'messages_show'
  
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
