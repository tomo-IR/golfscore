require 'rails_helper'

RSpec.describe Message, :type => :model do
  it "空のメッセージは投稿できない" do
    expect(FactoryBot.build(:message, :content => "")).to_not be_valid
  end
end
