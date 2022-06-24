class Food < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :measuring_unit, presence: true
  validates :price, presence: true
  validates :user, presence: true
end
