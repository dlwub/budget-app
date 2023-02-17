require 'rails_helper'

RSpec.describe "Wallets", type: :request do
  describe "GET /home" do
    it "returns http success" do
      get "/wallet/home"
      expect(response).to have_http_status(:success)
    end
  end

end
