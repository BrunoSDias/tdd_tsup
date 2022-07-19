require 'rails_helper'

RSpec.describe "/user_addresses", type: :request do
  before(:all) {
    @user = login
  }

  let(:valid_attributes) {
    attributes_for(:user_address, user_id: @user.id)
  }

  let(:invalid_attributes) {
    attributes_for(:user_address, street: nil)
  }

  describe "GET /show" do
    it "renders a successful response" do
      user_address = UserAddress.create! valid_attributes
      get user_address_url(user_address)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_user_address_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      user_address = UserAddress.create! valid_attributes
      get edit_user_address_url(user_address)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new UserAddress" do
        expect {
          post user_addresses_url, params: { user_address: valid_attributes }
        }.to change(UserAddress, :count).by(1)
      end

      it "redirects to the created user_address" do
        post user_addresses_url, params: { user_address: valid_attributes }
        expect(response).to redirect_to(user_address_url(UserAddress.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new UserAddress" do
        expect {
          post user_addresses_url, params: { user_address: invalid_attributes }
        }.to change(UserAddress, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post user_addresses_url, params: { user_address: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        new_attrs = valid_attributes
        new_attrs[:street] = Faker::Address.street_name
        new_attrs
      }

      it "updates the requested user_address" do
        user_address = UserAddress.create! valid_attributes
        patch user_address_url(user_address), params: { user_address: new_attributes }
        user_address.reload
        expect(response).to redirect_to(user_address_url(user_address))
      end

      it "redirects to the user_address" do
        user_address = UserAddress.create! valid_attributes
        patch user_address_url(user_address), params: { user_address: new_attributes }
        user_address.reload
        expect(response).to redirect_to(user_address_url(user_address))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        user_address = UserAddress.create! valid_attributes
        patch user_address_url(user_address), params: { user_address: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested user_address" do
      user_address = UserAddress.create! valid_attributes
      expect {
        delete user_address_url(user_address)
      }.to change(UserAddress, :count).by(-1)
    end

    it "redirects to the user_addresses list" do
      user_address = UserAddress.create! valid_attributes
      delete user_address_url(user_address)
      expect(response).to redirect_to(user_addresses_url)
    end
  end
end
