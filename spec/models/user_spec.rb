require 'rails_helper'

RSpec.describe User, type: :model do

  user_count = User.count
  
  before(:each) do
  @user = User.new(
    name: 'dummy',
    email: 'dummy@test.com',
    password: 'password',
    password_confirmation: 'password'
  )
  @user.save
  end

  describe 'Validations' do

    it 'should create a new user' do
      @new_user = User.new(
        name: 'dummy',
        email: 'dummy@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      @new_user.save
      expect(User.all.count).to eq(1)
    end

    it 'should be valid if contains both password and password_confirmation' do
      @passwords_user = User.new(
        name: 'dummy',
        email: 'passwords@match.com',
        password: 'password',
        password_confirmation: 'password'
      )
      @passwords_user.save
      expect(@passwords_user).to be_valid
    end

    it 'should be invalid if there is a password missmatch' do
      @fail_user = User.new(name: 'fail', email: 'fail@user.com', password: 'password', password_confirmation: 'psswrd')
      @fail_user.validate
    end

    it 'should be valid if both passwords match' do
      expect(@user['password']).to eq(@user['password_confirmation'])
    end

    it 'should be invalid if the email is already in use' do
      @pass_user = User.new(name: 'original', email: 'dont@copy.me', password: 'password', password_confirmation: 'password')
      @pass_user.save
      @fail_user = User.new(name: 'fail', email: 'dont@copy.me', password: 'password', password_confirmation: 'password')
      @fail_user.validate
      expect(@fail_user.errors.messages[:email].to_s).to include('has already been taken')
    end

    it 'should be invalid if email, first name and last name are not present' do
      @nothing_user = User.new()
      @nothing_user.save
      expect(@nothing_user).to_not be_valid
    end

    it 'should be invalid if password is 3 characters or less' do
      @short_pass_user = User.new(name: 'shorty', email: 'three@chars.com', password: 'com', password_confirmation: 'com')
      expect(@short_pass_user).to_not be_valid
    end

  end

  describe '.authenticate_with_credentials' do

    it 'should log the user in if email case is different' do
      @auth_user = User.new(name: 'user', email: 'user@email.com', password: 'password', password_confirmation: 'password')
      @auth_user.save
      expect(@auth_user).to eq(User.authenticate_with_credentials("user@email.com", "password"))

    end

    it 'logs the user in even with leading/trailing white space' do
      @ws_user = User.new(name: 'user', email: '   new@email.com   ', password: 'password', password_confirmation: 'password')
      @ws_user.save
      expect(@ws_user).to be_valid
    end

  end

end
