require 'rails_helper'

RSpec.describe 'Edit a todo spec' do
  it 'successfully' do
    password = '123456'
    user = create(:user, password: password, password_confirmation: password)
    todo = create(:todo, user_id: user.id)

    visit sessions_signin_path

    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: password

    click_on 'Enter'
    
    click_on 'Show this todo'
    click_on 'Edit this todo'

    fill_in 'todo[description]', with: todo[:description]

    find("input[type='submit']").click

    expect(page).to have_content "Welcome"
    expect(page).to have_content todo[:description]
  end
end