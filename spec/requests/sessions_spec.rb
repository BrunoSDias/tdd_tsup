require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /signin" do
    it "returns http success" do
      get "/sessions/signin"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /signup" do
    it "returns http success" do
      get "/sessions/signup"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "returns http success" do
      user = attributes_for(:user)
      post "/sessions/create", params: { session: user }
      expect(response).to redirect_to('/home/index')
    end
  end

  describe "POST /login" do
    it "returns http success" do
      password = '123456'
      user = create(:user, password: password, password_confirmation: password)

      post "/sessions/login", params: { session: { email: user[:email], password: password } }
      expect(response).to redirect_to('/home/index')
    end
  end

  describe "POST /signout" do
    it "returns http success" do
      login
      
      post "/sessions/signout"
      expect(response).to redirect_to('/sessions/signin')
    end
  end
end
