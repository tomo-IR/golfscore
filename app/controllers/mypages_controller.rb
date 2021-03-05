class MypagesController < ApplicationController
	before_action :authenticate_user!
  before_action :set_user, only: %i(index edit update)

	def index

	end

	def edit
		
	end

	def update
		if @user.update!(user_params)
			puts @user.avatar.current_path
			flash[:edit_success] = 'プロフィールが編集されました'
			redirect_to edit_mypage_path
		else
			flash.now[:danger] = '編集できませんでした'
			render 'mypages/index'
		end
	end

	private
	
	def set_user
		@user = User.find(current_user.id)
	end

	def user_params
    params.require(:user).permit(:name, :introduction, :avatar)
  end

end
