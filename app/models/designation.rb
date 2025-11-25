class Designation < ApplicationRecord
  has_paper_trail
  has_many :faculties, dependent: :destroy
end
