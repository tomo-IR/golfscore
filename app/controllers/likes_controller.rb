class LikesController < ApplicationController
	def new
		# @like = Like.new
	end

	def create
		@like = Like.new
		@like.user_id = current_user.id
		@like.message_id = params[:message_id]
		@like.save 
		# if @like.save 
		# 	flash.now[:danger] = 'いいねできました'
		# 	redirect_to root_path
		# else
		# 	flash.now[:danger] = 'いいねできませんでした'
		# end
	end

	def destroy
		@like = Like.find_by(message_id: params[:message_id])
		@like.destroy
		# flash.now[:danger] = 'いいね取り消しました'
		# redirect_to root_path
		
		# redirect_back(:fallback_location => root_path)
	end
end
