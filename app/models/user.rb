class User < ApplicationRecord
  validates :name, presence: true

  has_many :records, foreign_key: :user_id
  has_many :groups, foreign_key: :user_id
end
