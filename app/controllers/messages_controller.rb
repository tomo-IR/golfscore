class MessagesController < ApplicationController
    def index
        if user_signed_in?
            @messages = Message.all  # form_with 用
            # @messages = current_user.messages.order(id: :desc).page(params[:page])
            # @every_course = Message.select("course").distinct
            @every_course = Message.distinct.pluck(:course)
        end
    end
end
