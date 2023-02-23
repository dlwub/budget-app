class Category < ApplicationRecord
  belongs_to :user
  has_many :category_entities
  has_many :entities, through: :category_entities
  validates :name, presence: true
  validates :icon, presence: true
end
