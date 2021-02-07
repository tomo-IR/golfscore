set :output, 'log/crontab.log'
set :environment, ENV['RAILS_ENV']
 
every 1.day do
  rake "get_golfcourse_info:get"
end
