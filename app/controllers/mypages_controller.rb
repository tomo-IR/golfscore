class MypagesController < ApplicationController
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
end
