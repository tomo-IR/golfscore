require 'rails_helper'

RSpec.describe User, :type => :model do

  it '同じemailは登録できないこと' do
    @user = FactoryBot.build(:user)
    @user.save
    another_user = FactoryBot.build(:user)
    another_user.email = @user.email
    expect(another_user).to_not be_valid
  end
  it '同じnameは登録できないこと' do
    @user = FactoryBot.build(:user)
    @user.save
    another_user = FactoryBot.build(:user)
    another_user.name = @user.name
    expect(another_user).to_not be_valid
  end

  it "emailがなければ登録できない" do
    expect(FactoryBot.build(:user, email: "")).to_not be_valid
  end

  it "nameがなければ登録できない" do
    expect(FactoryBot.build(:user, :name => "")).to_not be_valid
  end

  it "passwordがなければ登録できない" do
    expect(FactoryBot.build(:user, :password => "")).to_not be_valid
  end

  it "passwordは5文字以下の場合は登録できない" do
    user = User.new(password: "a" * 5)
    expect(user).to be_invalid
  end
  it "factorybot_test" do
    expect(FactoryBot.build(:user)).to be_valid
  end
  # it "パスワードが暗号化されていない" do 
  #   user = FactoryBot.create(:user)
  #   expect(user.password_digest).to_not eq "password"
  # end 


  # it "パスワードが暗号化されているか" do
  #   user = FactoryBot.create(:user)
  #   expect(user.password_digest).to_not eq "password"
  # end

  it "password_confirmationとpasswordが異なる場合保存できない" do
    expect(FactoryBot.build(:user,password:"password",password_confirmation: "passward")).to_not be_valid
  end
end
