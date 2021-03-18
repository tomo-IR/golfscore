class Api::ArchiveusController < ApplicationController
  def index
    @scores =  Score.where(user_id: current_user.id)
                    .where(status: 1)
  end
end
