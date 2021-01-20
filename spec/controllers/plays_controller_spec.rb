require 'rails_helper'

RSpec.describe PlaysController, type: :controller do

  describe "GET #update" do
    it "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

end
