class Unit < ApplicationRecord
  has_many :departments, dependent: :destroy
end
