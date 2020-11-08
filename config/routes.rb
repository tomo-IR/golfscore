Rails.application.routes.draw do
  root to:'home#index'
  get '/home/index',to: 'home#index'
  get 'home/authentication'


  
  #◇「ラウンドする」まわりのルーティング
  get '/rounds/select_course', to: 'rounds#select_course' ,as: "select_course"
    #フォームを表示するview
    # @todoufukens はselect_courseアクションで定義
  post "/rounds/search", to: 'rounds#search'
  get '/rounds/search/:golfCourseName', to: 'rounds#show' ,as: "round_start"
  

  #◇「過去のスコアを見る」まわりのルーティング
  get "/archives",to: 'archives#index' ,as: "archives_index"
  get "archives/show/:round_id",to: 'archives#show' ,as: 'score_card'

  #◇「掲示板を覗く」まわりのルーティング
  get "/messages/index",to: 'messages#index'
  get '/messages/show/:course', to: 'messages#show' ,as: "every_course_message"


  #◇deviseまわりのルーティング

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 
  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "/users/sign_out", :to => "users/sessions#destroy" 
  end
end

# get "/search/:golfCourseName",to: 'coursenames#show' ,as: "test"
# post "/search", to: 'coursenames#search'