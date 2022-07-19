require 'rails_helper'

RSpec.describe 'Set a todo to complete' do
  it 'successfully' do
    user = signin
    todo = create(:todo, user_id: user.id)

    find("form[action='/complete_todo/#{todo.id}']").find("button", text: "Completar tarefa").click

    expect(page).to have_css("form[action='/complete_todo/#{todo.id}'] button", text: "Descompletar tarefa")
  end
end