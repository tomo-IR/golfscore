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





  devise_for :users
  
end

# get "/search/:golfCourseName",to: 'coursenames#show' ,as: "test"
# post "/search", to: 'coursenames#search'