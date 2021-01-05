class User < ApplicationRecord
  attr_reader :password

  validates :username, :session_token, uniqueness: true, presence: true
  validates :password_digest, presence: true

  def self.find_by_credentials(username, pw)
    user = User.find_by(username: username)
    if user && user.is_password?(pw)
      user
    else
      nil
    end
  end

  def password=(password)
    password_digest = BCrypt::Password.create(password)
  end

  def is_password?(pw)
    
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= reset_session_token!
  end

end
