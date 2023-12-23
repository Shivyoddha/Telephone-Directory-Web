class Department < ApplicationRecord
  rails_admin do
    label "Section"
  end
  has_many :users, dependent: :destroy
  has_many :faculties, dependent: :destroy
  has_many :sub_directories, dependent: :destroy
  belongs_to :unit
end
