class SubDirectory < ApplicationRecord
  rails_admin do
    label "Sub_section"
  end
  has_many :faculties
  has_and_belongs_to_many :departments
end
