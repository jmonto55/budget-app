class Category < ApplicationRecord
  validates :name, presence: true
  validates :icon, presence: true

  belongs_to :user
  has_and_belongs_to_many :expenses, foreign_key: :category_id, dependent: :destroy

  def total_amount
    expenses.map(&:amount).reduce(:+) || 0
  end
end
