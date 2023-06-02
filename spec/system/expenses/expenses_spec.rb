require 'rails_helper'

RSpec.describe 'Manage Expenses', type: :system do
  before(:each) do
    @user = User.create(name: 'Jose', email: 'jose@mail.com', password: '2e2010510',
                        password_confirmation: '2e2010510')
    @category = Category.new(user_id: @user.id, name: 'Car', icon: 'https://img.icons8.com/2266EE/color/dog')
    @expense = Expense.new(user_id: @user.id, category_id: @category.id, name: 'Tires', amount: 200)
  end

  it 'User should be able to create a new Expense' do
    visit root_path
    click_link('log-in')
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button('login')
    expect(page).to have_content('Signed in successfully.')
    click_link_or_button('NEW CATEGORY')
    fill_in 'Name', with: @category.name
    click_button('create-category')
    expect(page).to have_content('Category Car was successfully created.')
    sleep(2)
    click_link('Car')
    click_link_or_button('NEW EXPENSE')
    fill_in 'Name', with: @expense.name
    fill_in 'Amount', with: @expense.amount
    click_link_or_button('Create')
    expect(page).to have_content('expense was successfully created.')
    sleep(2)
  end
end
