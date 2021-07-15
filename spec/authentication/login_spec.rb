require 'rails_helper'
describe 'the signin process', type: :feature do
  before :each do
    User.create(email: 'user1@gmail.com', password: 'password', name: 'User1')
  end
  it 'signs @user in' do
    visit '/users/sign_in'
    fill_in 'Email', with: 'user1@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(current_path).to eq(root_path)
    expect(page).to have_text('Signed in successfully.')
  end

  it 'Should not signs @user in if not valid' do
    visit '/users/sign_in'
    fill_in 'Email', with: 'user12@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page).to have_text('Invalid Email or password.')
  end
end
