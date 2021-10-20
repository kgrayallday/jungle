class User < ActiveRecord::Base

  has_secure_password

  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 4 }, confirmation: { case_sensative: true }
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: { case_sensative: false }

  def self.authenticate_with_credentials(email, password)

    @user = User.find_by_email(email.strip.downcase)

    if @user && @user.authenticate(password)
      return @user
    else
      return nil
    end

  end

end
