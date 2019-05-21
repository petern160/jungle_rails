require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'should have miminum 5 length of password' do
      @user = User.new(email: "test@gmail.com", password: "1234")
      expect(@user).to_not be_valid
    end

    it 'should have unique email address' do
      @user = User.new(email: "test@gmail.com", password: "1234")
      @user.save

      @user = User.new(email: "test@gmail.com", password: "1234")
      expect(@user).to_not be_valid
    end


    it 'should have the same password and password confirmation' do
      @user = User.new(email: "test@gmail.com", password: "12345", password_confirmation: "54321", name: "input", last_name: "input")
      expect(@user).to_not be_valid
    end

    

    it 'is not valid without a email' do
      @user = User.create(email: nil, name: 'anything', last_name: 'anything', password: '12345', password_confirmation: '12345')
      expect(@user.errors.full_messages).to include("Email can't be blank")
  end

  it 'is not valid without a name' do
    @user = User.create(name: nil, email: 'input@test.com', last_name: 'anything', password: '12345', password_confirmation: '12345')
    expect(@user.errors.full_messages).to include("Name can't be blank")
end

it 'is not valid without a password' do
  @user = User.create(password: nil, email: 'input@test.com', last_name: 'anything', name: '12345', password_confirmation: '12345')
  expect(@user.errors.full_messages).to include("Password can't be blank")
end

it 'is not valid without a last name' do
  @user = User.create(last_name: nil, email: 'input@test.com', password: '12345', name: '12345', password_confirmation: '12345')
  expect(@user.errors.full_messages).to include("Last name can't be blank")
end

it 'is not valid without a last name' do
  @user = User.create(last_name: nil, email: 'input@test.com', password: '12345', name: '12345', password_confirmation: '12345')
  expect(@user.passwordSame?).to be(true)
end
end

describe '.authenticate_with_credentials' do
  it 'should return an instance with user email and password as object' do
    @user = User.create(last_name: nil, email: 'input@test.com', password: '12345', name: '12345', password_confirmation: '12345')
    expect(@user.create).to_not be_valid
  end
end
  
end
