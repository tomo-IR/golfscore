class MypagesController < ApplicationController
  before_action :set_user, only: %i(index edit update)

	def index

	end

	def edit
		@user.avatar.cache! unless @user.avatar.blank?
	end

	def update
		if @user.update!(user_params)
			puts @user.avatar.current_path
			flash[:edit_success] = '編集されました'
			redirect_to mypage_edit_path
		else
			flash.now[:danger] = 'スコアが編集されませんでした'
			render 'mypages/index'
		end
	end

	private
	
	def set_user
		@user = User.find(current_user.id)
	end

	def user_params
    params.require(:user).permit(:name, :introduction, :avatar, :avatar_cache)
  end



end
