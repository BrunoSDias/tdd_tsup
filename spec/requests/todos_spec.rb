require 'rails_helper'
RSpec.describe "/todos", type: :request do
  before(:all) {
    @user = login
  }
  
  let(:valid_attributes) {
    attributes_for(:todo, user_id: @user.id)
  }

  let(:invalid_attributes) {
    attributes_for(:todo, title: nil)
  }

  describe "GET /show" do
    it "renders a successful response" do
      todo = Todo.create! valid_attributes
      get todo_url(todo)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_todo_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      todo = Todo.create! valid_attributes
      get edit_todo_url(todo)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Todo" do
        expect {
          post todos_url, params: { todo: valid_attributes }
        }.to change(Todo, :count).by(1)
      end

      it "redirects to the created todo" do
        post todos_url, params: { todo: valid_attributes }
        expect(response).to redirect_to(home_index_path)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Todo" do
        expect {
          post todos_url, params: { todo: invalid_attributes }
        }.to change(Todo, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post todos_url, params: { todo: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        new_attrs = valid_attributes
        new_attrs[:title] = Faker::Book.title
        new_attrs
      }

      it "updates the requested todo" do
        todo = Todo.create! valid_attributes
        patch todo_url(todo), params: { todo: new_attributes }
        todo.reload
        expect(response).to redirect_to(home_index_path)
      end

      it "redirects to the todo" do
        todo = Todo.create! valid_attributes
        patch todo_url(todo), params: { todo: new_attributes }
        todo.reload
        expect(response).to redirect_to(home_index_path)
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        todo = Todo.create! valid_attributes
        patch todo_url(todo), params: { todo: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested todo" do
      todo = Todo.create! valid_attributes
      expect {
        delete todo_url(todo)
      }.to change(Todo, :count).by(-1)
    end

    it "redirects to the todos list" do
      todo = Todo.create! valid_attributes
      delete todo_url(todo)
      expect(response).to redirect_to(todos_url)
    end
  end
end
