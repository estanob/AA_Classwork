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

  describe '#reset_session_token!' do
    it 'generates a new session token' do
      user = FactoryBot.create(:user, username: 'Carlos', password: '123456')
      old_session_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).not_to eq(old_session_token)
    end

    it 'returns the new session token' do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end
  
  describe '#is_password?' do
    it 'returns true if password is correct' do
      user = FactoryBot.create(:user, username: 'Carlos', password: '123456') #.create will add to DB
      expect(user.is_password?(user.password)).to be true
    end

    it 'returns false if password is incorrect' do
      expect(user.is_password?('abcdef')).to be false
    end
  end
  
  describe '#password_encryption' do
    it 'does not save password to the database' do
      FactoryBot.create(:user, username: 'Carlos')
      user = User.find_by(username: 'Carlos')
      expect(user.password).not_to eq('password')
    end

    it 'ensures password is encrypted using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('123456')
      FactoryBot.build(:user, password: '123456')
    end
  end

  describe '::find_by_credentials' do
    context 'when params are valid' do
      it 'will find user given the username and correct password' do
        user = FactoryBot.create(:user, username: 'Carlos', password: '123456') #.create will add to DB
        expect(User.find_by_credentials('Carlos', '123456')).to eq(user)
      end
    end

    context 'when params are not valid' do
      it 'returns nil' do
        expect(User.find_by_credentials('Carlos', 'abcdef')).to eq(nil)
      end
    end
  end

  describe '#password=' do
    it 'creates the password instace variable when signing up the user' do 
      user = FactoryBot.create(:user, username: 'Carlos', password: '123456') #.create will add to DB
      expect(user.password).to eq('123456')
    end

    it 'creates and returns password_digest for user using BCrypt ' do 
      user = FactoryBot.create(:user, username: 'Carlos', password: '123456') #.create will add to DB
      expect(user.password=('123456')).not_to eq('123456')
    end
  end
end
