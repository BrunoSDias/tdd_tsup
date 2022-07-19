require 'rails_helper'

RSpec.describe 'Edit a user address' do
  it 'successfully' do
    password = '123456'
    user = create(:user, password: password, password_confirmation: password)
    user_adress = create(:user_address, user_id: user.id)

    visit sessions_signin_path

    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: password

    click_on 'Enter'


    click_on 'Perfil'
    click_on 'Endereço'

    fill_in 'user_address[street]', with: user_adress[:street]

    find("input[type='submit']").click

    expect(page).to have_content user_adress[:street]

    click_on "Back to home"

    expect(page).to have_content "Welcome"
  end
end