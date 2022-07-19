require 'rails_helper'

RSpec.describe 'Create a new user address' do
  it 'successfully' do
    signin
    todo = attributes_for(:todo)
    
    click_on 'Nova tarefa'

    fill_in 'todo[title]', with: todo[:title]
    fill_in 'todo[description]', with: todo[:description]
    fill_in 'todo[date]', with: 3.day.from_now

    find("input[type='submit']").click

    expect(page).to have_content "Welcome"
    expect(page).to have_content todo[:title]
  end
end