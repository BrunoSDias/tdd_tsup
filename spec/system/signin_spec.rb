require 'rails_helper'

RSpec.describe 'Signin' do
  it 'successfully' do
    password = '123456'
    user = create(:user, password: password, password_confirmation: password)

    visit sessions_signin_path

    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: password

    click_on 'Enter'

    expect(page).to have_content "Welcome #{user.name}"
  end
end