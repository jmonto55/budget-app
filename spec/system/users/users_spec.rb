require 'rails_helper'

RSpec.describe 'Log in Sign up', type: :system do
  before(:each) do
    @user = User.create(name: 'Jose', email: 'jose@mail.com', password: '2e2010510',
                        password_confirmation: '2e2010510')
    @user_two = User.new(name: 'Test Account', email: 'test@mail.com', password: 'password')
  end

  it 'User should be able to log in' do
    visit root_path
    click_link('log-in')
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    sleep(3)
    click_button('login')
    expect(page).to have_content('Signed in successfully.')
    sleep(2)
  end
  it 'User should be able to sign up' do
    visit root_path
    click_link('sign-up')
    fill_in 'Full Name', with: @user_two.name
    fill_in 'Email', with: @user_two.email
    fill_in 'Password', with: @user_two.password
    fill_in 'Password confirmation', with: @user_two.password
    sleep(3)
    click_button('signup')
    expect(page).to have_content('Welcome! You have signed up successfully.')
    sleep(2)
  end
end
