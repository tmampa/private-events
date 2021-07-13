require 'rails_helper'
describe 'the signin process', type: :feature do
  it 'should not save user without name' do
    user = User.new(email: 'seba@mail.com', password: '1234141')
    expect(user.save).to be(false)
  end

  it 'should not save user without email' do
    user = User.new(name: 'Seba', password: '1234141')
    expect(user.save).to be(false)
  end

  it 'should not save user without password' do
    user = User.new(name: 'Seba', email: 'seba@mail.com')
    expect(user.save).to be(false)
  end

  it 'should save user with all fields' do
    user = User.new(name: 'Seba', email: 'seba@mail.com', password: '31334134')
    user.save
    expect(user.name).to eq('Seba')
  end
end
