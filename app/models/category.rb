class Category < ApplicationRecord
  validates :name, presence: true
  validates :icon, presence: true,
                   format: { with: %r{(http(s?):)([/|.\w\s-])*\.(?:jpg|gif|png|jpeg)}, message: 'Invalid format' }

  belongs_to :user
  has_and_belongs_to_many :expenses, foreign_key: :category_id

  def total_amount
    expenses.map(&:amount).reduce(:+) || 0
  end

  def list_expenses
    expenses.order(created_at: :desc)
  end
end
