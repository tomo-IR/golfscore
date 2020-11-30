class LikesController < ApplicationController
    def create
        @like = current_user.likes.create(id: params[:id], user_id: current_user.id)
    #   redirect_to root_path
        redirect_back(fallback_location: root_path)
    end

    def destroy
        @like = Like.find_by(message_id: params[:message_id], user_id: current_user.id)
        @like.destroy
    #   redirect_to root_path
        redirect_back(fallback_location: root_path)
    end
end