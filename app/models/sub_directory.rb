class SubDirectory < ApplicationRecord
  rails_admin do
    label "Sub_section"
  end
  has_many :faculties
  belongs_to :department
end
