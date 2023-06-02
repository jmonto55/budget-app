require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.new(name: 'Test Account', email: 'test@mail.com', password: 'password') }
  let(:food) do
    Category.create(user_id: u1.id, name: 'Leisure', icon: 'https://img.icons8.com/2266EE/color/debt')
  end

  describe 'attributes' do
    it 'has a name' do
      expect(food.name).to eq('Beans')
    end

    it 'has "grams" as measurement unit' do
      expect(food.measurement_unit).to eq('grams')
    end

    it 'has a price of 10' do
      expect(food.price).to eq(10.0)
    end
  end
end
