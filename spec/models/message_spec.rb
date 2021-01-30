require 'rails_helper'

RSpec.describe Message, :type => :model do
  it "空のメッセージは投稿できる" do
    expect(FactoryBot.build(:message, :content => "")).to be_invalid
  end

  it "contentは100文字以上の場合は登録できない" do
    message = Message.new(content: "a" * 101)
    expect(message).to be_invalid
  end
end
