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
        
    end
end
