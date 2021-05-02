class MessagesController < ApplicationController
	before_action :authenticate_user!
	def index
		@golfcourses = Golfcourse.search(params[:search])
															.page(params[:page])
															.per(10) #ページネーション

	end

	def index_course
		@golfcoursename = Golfcourse.find(params[:golfcourse_id])
		@message = Message.new
    @messages = Message.where(golfcourse_id: params[:golfcourse_id])
                        .order(created_at: "DESC")
                        .includes([:user])
                        .page(params[:page]).per(10)
	end

	def show
		@message = Message.find(params[:message_id])
	end

	def create
		@message = Message.new(message_params)
    @message.golfcourse_id = params[:golfcourse_id]
		@message.user_id = current_user.id
		@message.save
	end

	def destroy
		@message = Message.find(params[:message_id])
		if @message.user.id == current_user.id
			@message.destroy
		end
	end

	def new
		@message = Message.new
	end

	private

  def message_params
    params.require(:message).permit(:content, :image, :golfcourse_id)
  end

end
