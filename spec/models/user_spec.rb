require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = User.new
  end

  describe 'Validations' do

    it 'shows passwords do not match' do
      userOne = User.new(first_name: 'User', last_name: 'One', email: 'UserOne@example.com', password: 'password', password_confirmation: 'Password')
      userOne.valid?
      expect(userOne.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'password not provided' do
      userOne = User.new(first_name: 'User', last_name: 'One', email: 'UserOne@example.com', password: nil, password_confirmation: 'Password')
      userOne.valid?
      expect(userOne.errors.full_messages).to include("Password can't be blank", "Password is too short (minimum is 3 characters)")
    end

    it 'prevents existing user from re-signup' do
      userOne = User.new(first_name: 'User', last_name: 'One', email: 'UserOne@example.com', password: 'Password', password_confirmation: 'Password')
      userOne.save
      userTwo = User.new(first_name: 'User', last_name: 'One', email: 'UserOne@example.com', password: 'Password', password_confirmation: 'Password')
      userTwo.valid?
      expect(userTwo.errors.full_messages).to include("Password can't be blank", "Password is too short (minimum is 3 characters)")
    end

    it 'will if email already exists reagrdless of case_sensitive' do
      userOne = User.new(first_name: 'User', last_name: 'One', email: 'UserOne@example.com', password: 'Password', password_confirmation: 'Password')
      userOne.save
      userTwo = User.new(first_name: 'User', last_name: 'One', email: 'USERONE@EXAMPLE.COM', password: 'Password', password_confirmation: 'Password')
      userTwo.valid?
      expect(userTwo.errors.full_messages).to include("Email has already been taken")
    end

    it 'should not let user register if first_name is empty' do
      userOne = User.new(first_name: nil, last_name: 'One', email: 'UserOne@example.com', password: 'Password', password_confirmation: 'Password')
      userOne.valid?
      expect(userOne.errors.full_messages).to include("First name can't be blank")
    end

    it 'should not let user register if last_name is empty' do
      userOne = User.new(first_name: 'User', last_name: nil, email: 'UserOne@example.com', password: 'Password', password_confirmation: 'Password')
      userOne.valid?
      expect(userOne.errors.full_messages).to include("Last name can't be blank")
    end

    it 'should not let user register if password length is less than 3' do
      userOne = User.new(first_name:'User', last_name: 'One', email: 'UserOne@example.com', password: 'Pa', password_confirmation: 'Pa')
      userOne.valid?
      expect(userOne.errors.full_messages).to include("Password is too short (minimum is 3 characters)")
    end

  describe '.authenticate_with_credentials' do

    it 'should not authenticate when email is blank' do
      userOne = User.authenticate_with_credentials(' ', 'Password')
      expect(userOne).to eq(nil)
    end

    it 'should not authenticate when password is blank' do
      userOne = User.authenticate_with_credentials('UserOne@example.com', nil)
      expect(userOne).to eq(nil)
    end

    it 'should return the user with valid login details' do
      userOne = User.new(first_name: 'User', last_name: 'One', email: 'UserOne@gmail.com', password: 'Password', password_confirmation: 'Password')
      userOne.save
      userTwo = User.authenticate_with_credentials("UserOne@gmail.com", "password")
      expect(userTwo.first_name).to eq('User')
    end

#come back to this 

  end
  end
end