FactoryBot.define do
  factory :score do
    user_id { 1 }
    golfcourse_id { 1 }
    played_date { '2020-01-02T00:00:00Z' }
    status { 0 }
    published { 1 }
  end
end
