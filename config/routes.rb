Rails.application.routes.draw do
  root to:'home#index'
  get '/home/index',to: 'home#index'
  get 'home/authentication'


  
  #◇「ラウンドする」まわりのルーティング
  get '/rounds/select_course', to: 'rounds#select_course' ,as: "select_course"
    #フォームを表示するview
    # @todoufukens はselect_courseアクションで定義
  post "/rounds/search", to: 'rounds#search'
    #ゴルフ場検索結果を表示するページ
  get '/rounds/search/:course', to: 'rounds#show' ,as: "round_start"
  get '/rounds/play/:course/:round_id', to: 'rounds#play' ,as: "round_play"
    #URLは無駄に長くならないように、（TODAYはデータベースから引っ張るデータを変える）
  get "rounds/input/:round_id/:hole_number",to: 'rounds#input' ,as: 'hole_score_input'
  post "rounds/input/:round_id/:hole_number",to: 'rounds#update' ,as: 'hole_score_new'


  #◇「過去のスコアを見る」まわりのルーティング
  get "/archives",to: 'archives#index' ,as: "archives_index"
  get "archives/show/:round_id",to: 'archives#show' ,as: 'score_card'
  get "archives/edit/:round_id",to: 'archives#edit' ,as: 'scorecard_edit'
  get "archives/edit/:round_id/:hole_number",to: 'archives#edit_score' ,as: 'edit_hole_score'
  get "archives/edit_score/:round_id/:hole_number",to: 'archives#hole_score_edit' ,as: 'score_update'  
  post "archives/edit/:round_id/:hole_number",to: 'archives#update' ,as: 'hole_score_update'
  get "/archives/:round_id",to: 'archives#destroy_score_card' ,as: "hole_score_delete"

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