class HomeController < ApplicationController
  def index
    @todos = current_user.todos
  end
end
