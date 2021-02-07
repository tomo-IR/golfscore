require 'rails_helper'

RSpec.describe Message, :type => :model do

  it "contentとimage、両方カラは投稿できない" do
    message = Message.new(content: "", image: "")
    expect(message).to_not be_valid
  end

  it "contentカラ、image有りは投稿できる" do
    expect(FactoryBot.build(:message, content: "")).to be_valid
  end

  it "imageカラ、content有りは投稿できる" do
    expect(FactoryBot.build(:message, image: "")).to be_valid
  end

  it "ログアウト時は投稿できない" do
    expect(FactoryBot.build(:message, user_id: "")).to_not be_valid
  end

  it "contentは100文字以上の場合は登録できない" do
    message = Message.new(content: "a" * 101)
    expect(message).to_not be_valid
  end
  
end
