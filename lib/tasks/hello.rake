namespace :hello do
  task :world => :environment do
    hw = HelloWorld.new
    puts hw.hoge
  end
end
