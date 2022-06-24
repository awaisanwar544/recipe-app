class Food < ApplicationRecord
  belongs_to :user

  has_many :recipe_foods
  has_many :recipes, through: :recipe_foods

  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :measuring_unit, presence: true
  validates :price, presence: true
  validates :user, presence: true
end
