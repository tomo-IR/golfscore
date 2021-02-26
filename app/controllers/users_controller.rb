class UsersController < ApplicationController
  before_action :set_user, only: %i(update)

  def index
    @users = User.search(params[:search])
                  .where.not(:name => "ゲストプレイヤー")
                  .where.not(:id => current_user.id)
                  .page(params[:page]).per(10) #ページネーション
  end

  def show
    @user  = User.find(params[:id])
    @score = @user.scores
                  .where(status: 1)
                  .where(published: 1)
                  .includes([:golfcourse])
                  .order(played_date: :desc)
                  .page(params[:page]).per(5) #ページネーション
  end


  def following
    @user  = User.find(params[:id])
    @users = @user.followings#.page(params[:page]).per(5) #ページネーション
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers#.page(params[:page]).per(5) #ページネーション
    render 'show_follower'
  end

  def update
    if @user.update!(user_params)
        flash[:edit_success] = 'プロフィールが編集されました'
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
    params.require(:user).permit(:name, :introduction, :avatar)
  end
  
end
