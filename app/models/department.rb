class Department < ApplicationRecord
  rails_admin do
    label "Section"
  end
has_and_belongs_to_many :users, join_table: 'users_departments'
  has_many :faculties, dependent: :destroy
  has_and_belongs_to_many :sub_directories
  belongs_to :unit
  validates :custom_order, presence: true, numericality: { only_integer: true }
end
