class LikesController < ApplicationController
	before_action :authenticate_user!
	def new
	end

	def create
		@like = Like.new
		@like.user_id = current_user.id
		@like.message_id = params[:message_id]
		@like.save 
	end

	def destroy
		@like = Like.find_by(message_id: params[:message_id])
		@like.destroy
	end
end
