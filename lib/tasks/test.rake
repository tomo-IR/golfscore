namespace :test do
  desc 'test'
  task test: :environment do
    # logger = Logger.new 'log/test.log'
    puts 'hoge'
  end
end
