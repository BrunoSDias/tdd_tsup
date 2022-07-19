require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { is_expected.to have_one(:user_address) }
    it { is_expected.to have_many(:todos) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name)}
    it { is_expected.to validate_presence_of(:email)}
    it { is_expected.to validate_uniqueness_of(:email)}
  end
end
