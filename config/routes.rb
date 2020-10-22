Rails.application.routes.draw do
  root to:'home#index'
  get '/home/index',to: 'home#index'
  get 'home/authentication'
  resources :coursenames
  get "/search/:golfCourseName",to: 'coursenames#show' ,as: "test"
  post "/search", to: 'coursenames#search'
  get "/rounds/select_course" ,to: 'rounds#search'
  get "/archives",to: 'archives#index' ,as: "archives_index"
  devise_for :users
end
