require 'rails_helper'

RSpec.describe MessagesController, :type => :controller do
  # before do
  #   @user = FactoryBot.create(:user)
  #   @another_user = FactoryBot.create(:another_user)
  #   @message = FactoryBot.create(:message)
  # end

  describe "#index" do
    it "メッセージインデックスのレスポンス" do
      get :index
      expect(response).to be_successful
    end

    it "正常なリクエストか" do
      get :index
      expect(response).to have_http_status "200"
    end
  end
  describe "#show" do
    it "メッセージインデックスのレスポンス" do
      get :show, :params => { :id => @message.id }
      expect(response).to be_successful
    end

    it "正常なリクエストか" do
      get :show
      expect(response).to have_http_status "200"
    end
  end
end
