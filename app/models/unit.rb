class Unit < ApplicationRecord
  rails_admin do
    label "Section"
  end
  has_many :departments, dependent: :destroy
end
