require 'rails_helper'

RSpec.describe User, type: :model do
  
  before(:each) do
  @user = User.new(
    name: 'dummy',
    email: 'dummy@test.com',
    password: 'password',
    password_confirmation: 'password'
  )
  @user.save

  @bad_user_ids = User.new(
    name: nil,
    email: nil,
    password: 'password',
    password_confirmation: 'password'
  )
  end

  # am I validating before the object enters the data base or after?

  describe 'Validations' do

    it 'should have created a user' do
      expect(User.all.count).to eq(1)
    end

    it 'should contain password and password_confirmation' do
      expect(@user).to be_valid
    end
    
    it 'is not valid if the passwords do not match' do
      expect(@user.password).to eq(@user.password_confirmation)
    end

    it 'is not valid if the email already exists' # check all users for email

    it 'is valid if email, first name and last name are present' do
      @user.email = nil
      @user.name = nil # no first_name last_name just name... did i screw this up?
      expect(@user).to_not be_valid
    end

    it 'is valid if the password is more than three characters'

    it 'logs the user in if email case is different'
      # expect(actual).to match(/expression/)
    it 'logs the user in even with leading/trailing white space'

  end
end
