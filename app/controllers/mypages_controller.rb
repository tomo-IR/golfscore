class MypagesController < ApplicationController
<<<<<<< HEAD
    def index
        @user = User.find(current_user.id)
    end
    def edit
        @user = User.find(current_user.id)
    end
    def update
        @user = User.find(current_user.id)
        if @user.update!(:name => params[:name], :introduction => params[:introduction])
            flash[:edit_success] = '編集されました'
            redirect_to mypage_edit_path
        else
            flash.now[:danger] = 'スコアが編集されませんでした'
            render 'mypages/index'
        end
    end
=======
  before_action :set_user, only: %i(index edit update)

	def index

	end

	def edit

	end

	def update
		if @user.update!(:name => params[:name], :introduction => params[:introduction])
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

>>>>>>> parent of f4e06bf... Revert "ruby-v-up"
end
