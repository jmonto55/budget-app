require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:user) { User.new(name: 'Test Account', email: 'test@mail.com', password: 'password') }
  let(:category) do
    Category.create(user_id: user.id, name: 'Leisure', icon: 'https://img.icons8.com/2266EE/color/debt')
  end
  let(:expense) do
    Expense.create(user_id: user.id, category_id: category.id, name: 'Movie tickets', amount: 20.0)
  end
  
  describe 'attributes' do
    it 'has a name' do
      expect(expense.name).to eq('Movie tickets')
    end

    it 'has the right amount' do
      expect(expense.amount).to eq(20.0)
    end
  end
end
