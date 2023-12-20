class Designation < ApplicationRecord
  has_many :faculties, dependent: :destroy
end
