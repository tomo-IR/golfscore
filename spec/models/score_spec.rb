require 'rails_helper'

RSpec.describe Score, :type => :model do

  it "golfcourse_idの選択なしでは投稿できない" do
    expect(FactoryBot.build(:score, golfcourse_id: nil)).to_not be_valid
  end

end
