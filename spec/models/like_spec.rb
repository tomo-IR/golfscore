require 'rails_helper'

RSpec.describe Like, :type => :model do

  it "1つのメッセージに対し、同じユーザーが2いいね以上できない" do
    like = FactoryBot.build(:like)
    like.save
    another_like = FactoryBot.build(:like)
    another_like.save
    expect(another_like).to_not be_valid
  end

end
