class Transaction < ApplicationRecord
  belongs_to :user
  has_many :category_transactions
  has_many :categories, through: :category_transactions
  validates :name, presence: true
  validates :amount, presence: true, numericality: true, comparison: { greater_than: 0 }
  validates :category, presence: true
end
