require File.expand_path(File.dirname(__FILE__) + "/environment")
set :environment, :production
set :output, "#{Rails.root}/log/cron.log" 


every 5.minute do
  rake "get_golfcourse_info:get"
end
