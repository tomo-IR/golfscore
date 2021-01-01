# # Rails.rootを使用するために必要
require File.expand_path(File.dirname(__FILE__) + "/environment")
# # cronを実行する環境変数
rails_env = ENV['RAILS_ENV'] || :development
# # cronを実行する環境変数をセット
set :environment, rails_env
# # cronのログの吐き出し場所
set :output, "#{Rails.root}/log/cron.log"

every 1.minutes do
    # job_type :rake,    "cd :path && :environment_variable=:environment bundle exec rake :task --silent :output"
    rake "example" # lib/tasksあたりに置いているタスクだよ
end

every 1.minutes do
    # job_type :runner,  "cd :path && bin/rails runner -e :environment ':task' :output"
    runner "Sample.test" # モデルに書いたメソッドだよ
end

