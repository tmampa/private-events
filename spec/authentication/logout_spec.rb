require 'rails_helper'
describe 'the signout process', type: :feature do
  before :each do
    User.create(email: 'user1@gmail.com', password: 'password', name: 'User1')
  end
  it 'Log out the user' do
    visit '/users/sign_in'
    fill_in 'Email', with: 'user1@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Logout'
    expect(current_path).to eq(root_path)
    expect(page).to have_text('Signed out successfully.')
  end
end
