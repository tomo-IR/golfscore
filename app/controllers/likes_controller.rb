class LikesController < ApplicationController
    def create
        @like = Like.new(message_id: params[:id], user_id: current_user.id)
    #   redirect_to root_path
        if @like.save 
            redirect_to root_path
        else
            flash.now[:danger] = 'いいねできませんでした'
        end
    end

    def destroy
        @like = Like.find_by(message_id: params[:message_id], user_id: current_user.id)
        @like.destroy
    #   redirect_to root_path
        redirect_back(fallback_location: root_path)
    end
end
# def message_post
#     @message = Message.new(content: params[:content], course: params[:course], user_id: current_user.id, image: params[:image])
    
#     if @message.save 
#       flash[:message_post_success] = 'メッセージが投稿されました'
#       redirect_to round_play_path(course: params[:course], round_id: params[:round_id])
       
#     else
#       flash.now[:danger] = 'スコアが編集されませんでした'
      
#     end
#   end

#   private
#   # Strong Parameter
#   def message_params
#     params.require(:@message).permit(:content, :user_id, :course, :image)
#   end