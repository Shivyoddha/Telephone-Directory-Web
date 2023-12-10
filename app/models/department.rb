class Department < ApplicationRecord
  has_many :users
  has_many :faculties
  belongs_to :unit
end
