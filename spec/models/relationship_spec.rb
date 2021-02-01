require 'rails_helper'

RSpec.describe Relationship, :type => :model do

  it "同じユーザーを2回フォローできない。" do
    follow = FactoryBot.build(:relationship)
    follow.save
    another_follow = FactoryBot.build(:relationship)
    another_follow.save
    expect(another_follow).to_not be_valid
  end

end
