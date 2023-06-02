require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.new(name: 'Test Account', email: 'test@mail.com', password: 'password') }
  let(:category) do
    Category.create(user_id: user.id, name: 'Leisure', icon: 'https://img.icons8.com/2266EE/color/debt')
  end
  let(:expense1) do
    Expense.create(user_id: user.id, category_id: category.id, name: 'Movie tickets', amount: 20.0)
  end
  
  let(:expense2) do
    Expense.create(user_id: user.id, category_id: category.id, name: 'Popcorn', amount: 5.0)
  end
  
  let(:expense3) do
    Expense.create(user_id: user.id, category_id: category.id, name: 'Soda', amount: 3.0)
  end
  
  describe 'attributes' do
    it 'has a name' do
      expect(category.name).to eq('Leisure')
    end

    it 'has the right icon' do
      expect(category.icon).to eq('https://img.icons8.com/2266EE/color/debt')
    end

    it 'checks total amount is correct' do
      category.expenses << expense1 << expense2 << expense3
      expect(category.total_amount).to eq(28.0)
    end
  end
end
