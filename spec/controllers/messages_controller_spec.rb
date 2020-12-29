require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  describe "#index" do

    it "メッセージインデックスのレスポンス" do
      get :index
      expect(response).to be_success
    end

    it "正常なリクエストか" do
      get :index
      expect(response).to have_http_status "200"
    end
  end
end
