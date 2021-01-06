require 'rails_helper'

RSpec.describe User, type: :model do
  # test validation, associations, class methods
  it { should validate_presence_of(:username)}
  it { should validate_presence_of(:pasword_digest)}
  it { should validate_length_of(:password).is_at_least(6)}

  subject(:lina) {FactoryBot.create(:user)}

  it { should validate_uniqueness_of(:username)}

  
  describe '#ensure_session_token' do
    it 'assigns a session token if none is given' do
      expect(FactoryBot.build(:user).session_token).not_to be nil
    end
  end
  
  
  
  
  
  
  
  describe '#password_encryption' do
    it 'does not save password to the database' do
      FactoryBot.create(:user, username: 'Carlos')
      user = User.find_by(username: 'Carlos')
      expect(user.password).not_to eq('password')
    end
  end
end
