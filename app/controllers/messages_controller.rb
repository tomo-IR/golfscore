class MessagesController < ApplicationController
    def index

            @messages = Message.all  # form_with 用
            # @messages = current_user.messages.order(id: :desc).page(params[:page])
            # @every_course = Message.select("course").distinct
            @every_course = Message.distinct.pluck(:course)
            # params[:course] = 

    end
    def show
        @message_course = params[:course]
        @course_params = params[:course]
        # @mmm = Message.find_by("course: course_params")
        @messages = Message.where(course: params[:course])
        @like = Like.new
    end
    def show_message
        @message = Message.find(params[:id])
        @like = Like.new
    
    end
end
