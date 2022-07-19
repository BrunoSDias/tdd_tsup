require 'rails_helper'

RSpec.describe 'Signin' do
  it 'successfully' do
    user = signin

    expect(page).to have_content "Welcome #{user.name}"
  end
end