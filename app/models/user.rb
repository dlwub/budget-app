class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :categories
  has_many :entities
  validates :full_name, presence: true
  validates :email, presence: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
end
