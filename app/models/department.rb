class Department < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :faculties, dependent: :destroy
  belongs_to :unit
end
