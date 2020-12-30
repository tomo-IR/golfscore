class MessagesController < ApplicationController
    def index
        @messages = Message.all.includes(:user)
        @every_course = Message.distinct
                               .pluck(:course)
    end
    def show
        @message_course = params[:course]
        @course_params = params[:course]
        @messages = Message.where(:course => params[:course]).includes(:user)
        @like = Like.new
    end
    def show_message
        @message = Message.find(params[:id])
        @like = Like.new
    end
end
