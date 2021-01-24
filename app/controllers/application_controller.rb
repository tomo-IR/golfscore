class ApplicationController < ActionController::Base
  protect_from_forgery :with => :exception
  before_action :configure_permitted_parameters, :if => :devise_controller?


  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user   = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end



  protected

  def configure_permitted_parameters
    added_attrs = [ :email, :name, :password, :password_confirmation ]
    devise_parameter_sanitizer.permit :sign_up, :keys => added_attrs
    devise_parameter_sanitizer.permit :account_update, :keys => added_attrs
    devise_parameter_sanitizer.permit :sign_in, :keys => added_attrs
  end
  
end
