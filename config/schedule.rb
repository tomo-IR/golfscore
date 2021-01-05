set :output, '/usr/src/app/log/cron.log'
set :environment, :development
# env :PATH, ENV['PATH']
# job_type :rake, "cd :path && :environment_variable=:environment bundle exec rake :task --silent :output"

# ENV.each { |k, v| env(k, v) } #追加
every 1.minutes do
	rake 'hello:world'
end
every 1.minutes do
	begin
	  rake "rss:hello"
	rescue => e
	  raise e
	end
  end
