require 'rails_helper'

RSpec.describe 'Create a new user address' do
  it 'successfully' do
    signin
    user_adress = attributes_for(:user_address)

    click_on 'Perfil'
    click_on 'Endereço'

    fill_in 'user_address[street]', with: user_adress[:street]
    fill_in 'user_address[number]', with: user_adress[:number]
    fill_in 'user_address[city]', with: user_adress[:city]
    fill_in 'user_address[state]', with: user_adress[:state]

    find("input[type='submit']").click

    expect(page).to have_content user_adress[:street]

    click_on "Back to home"

    expect(page).to have_content "Welcome"
  end
end