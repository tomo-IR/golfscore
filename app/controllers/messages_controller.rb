class MessagesController < ApplicationController
	def index
		@messages = Message.all.includes(:user).includes(:golfcourse)
		@every_course_id = Message.distinct.pluck(:golfcourse_id)
		# ↑この配列を予め並び替え得とく
		@golfcoursename = Golfcourse.all
		@every_course_name = Golfcourse.where(id: @every_course_id)#.order(created_at: :desc)
	end

	def index_course
		@message_course = params[:golfcourse_id]
		@course_name = Message.find_by(golfcourse_id: params[:golfcourse_id])
		@messages = Message.where(:golfcourse_id => params[:golfcourse_id]).includes(:user).page(params[:page]).per(20)
		@like = Like.new
	end

	def show
		@message = Message.find(params[:message_id])
	end

	def create
		@message = Message.new(message_params)
		playing_course = Score.find(params[:score_id])
    golfcourse_id = playing_course.golfcourse_id
    @message.golfcourse_id = golfcourse_id
		@message.user_id = current_user.id
		@message.save
	end

	def new
		@message = Message.new
	end

	private

  def message_params
    params.require(:message).permit(:content, :score_id, :image)
  end

end
