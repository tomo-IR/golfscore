set :output, 'log/crontab.log'
set :environment, ENV['RAILS_ENV']
# Rails.rootを使用するために必要
require File.expand_path(File.dirname(__FILE__) + "/environment")
# cronを実行する環境変数
rails_env = ENV['RAILS_ENV'] || :development
# cronを実行する環境変数をセット
set :environment, rails_env
# cronのログの吐き出し場所
set :output, "#{Rails.root}/log/cron.log"

every 5.minute do
  rake "get_golfcourse_info:get"
end
