env :PATH, ENV['PATH']
# ログファイルの出力先
set :output, 'log/cron.log'
# ジョブの実行環境の指定
set :environment, :production


every 7.days do
  rake "get_golfcourse_info:get"
end
