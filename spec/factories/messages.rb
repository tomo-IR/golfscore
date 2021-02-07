FactoryBot.define do
  factory :message do
    id { 1000 }
    content { "hoge" }
    image  {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/image.jpg')) }
    # created_at { '2020-01-01T00:00:00Z' }
    # updated_at { '2020-01-02T00:00:00Z' }
    association :user
    association :golfcourse
  end
end
