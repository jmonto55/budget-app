require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'Test Account', email: 'test@mail.com', password: 'password') }
  let(:category) do
    Category.create(user_id: user.id, name: 'Leisure', icon: 'https://img.icons8.com/2266EE/color/debt')
  end

  let(:expense_one) do
    Expense.create(user_id: user.id, category_id: category.id, name: 'Movie tickets', amount: 20.0)
  end
  let(:expense_two) do
    Expense.create(user_id: user.id, category_id: category.id, name: 'Dinner out', amount: 15.0)
  end
  let(:expense_three) do
    Expense.create(user_id: user.id, category_id: category.id, name: 'Car wash', amount: 30.0)
  end

  describe 'attributes' do
    it 'has a name' do
      expect(user.name).to eq('Test Account')
    end

    it 'has the right email' do
      expect(user.email).to eq('test@mail.com')
    end

    it 'has the right email' do
      category.expenses << expense_one << expense_two << expense_three
      user.categories << category
      expect(user.total_spent).to eq(65)
    end
  end
end
