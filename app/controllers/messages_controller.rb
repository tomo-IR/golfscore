class MessagesController < ApplicationController
	def index
		@messages = Message.all.includes(:user).includes(:golfcourse)
		@every_course = Message.distinct.pluck(:golfcourse_id)
		@golfcoursename = Golfcourse.all
	end

	def index_course
		@message_course = params[:golfcourse_id]
		@course_name = Message.find_by(golfcourse_id: params[:golfcourse_id])
		@messages = Message.where(:golfcourse_id => params[:golfcourse_id]).includes(:user).includes(:golfcourse)
		@like = Like.new
	end

	def show
		@message = Message.where(params[:golfcourse_id])
		@like = Like.new
	end

	def create
		@message = Message.new(message_params)

		playing_course = Score.find(params[:id])
    golfcourse_id = playing_course.golfcourse_id
    @message.golfcourse_id = golfcourse_id
		@message.user_id = current_user.id

		@message.save
		# 	flash[:edit_success] = 'メッサージを投稿しました'
		# 	redirect_to root_path
		# else
		# 	flash[:edit_success] = 'メッサージを投稿できませんでした'
		# 	render :new
		# end
	end



	def new
		# @message = Message.new
	
	end

	private

  def message_params
    params.permit(:content)
  end

end
