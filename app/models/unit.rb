class Unit < ApplicationRecord
  has_many :departments, dependent: :destroy
  validates :custom_order, presence: true, numericality: { only_integer: true }
end
