class User < ApplicationRecord
  validates :username, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: {message: "Password can\'t be blank"}
  validates :password, length: {minimum: 6, allow_nil: true}
  before_validation :ensure_session_token

  attr_reader :password
  attr_accessor :session_token

  def self.find_by_credentials(username, password)
    User.find(username: username).where(password_digest: BCrypt::Password.create(password))
  end

  def self.generate_session_token!
    SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(val)
    @password = val,
    @password_digest = BCrypt::Password.create(@password)
    self.update(password_digest: @password)
  end

end
