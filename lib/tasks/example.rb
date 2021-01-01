task example: :environment do
  Rails.logger.info "example: #{Time.current}"
end
  
# app/models/sample.rb
class Sample
	def self.test
  	Rails.logger.warn "test: #{Time.current}"
  end
end
