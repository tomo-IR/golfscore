class HomeController < ApplicationController
  def index
    require "date"
    @day = Date.today
 
 
  end

  def authentication
  end
end
