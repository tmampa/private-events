require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should not save user without name' do
    user = User.new(email: 'seba@mail.com', password: '1234141')
    assert_not user.save, 'Name is missing'
  end

  test 'should not save user without email' do
    user = User.new(name: 'Seba', password: '1234141')
    assert_not user.save, 'Email is missing'
  end

  test 'should not save user without password' do
    user = User.new(name: 'Seba', email: 'seba@mail.com')
    assert_not user.save, 'Password is missing'
  end

  test 'should save user with all fields' do
    user = User.new(name: 'Seba', email: 'seba@mail.com', password: '31334134')
    assert user.save, 'User saved'
  end
end
