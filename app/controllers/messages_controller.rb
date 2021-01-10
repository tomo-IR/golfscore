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

end
