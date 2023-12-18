class Faculty < ApplicationRecord
  rails_admin do
    label "NITK Staff"
  end

  belongs_to :department
  has_one_attached :profile, dependent: :destroy

  filterrific(
    available_filters: [
      :search_query,
      :with_department_id,
      :search_designation,
      :search_designation_advanced,
      :with_department_id_advanced
    ]
  )

  scope :search_query, ->(query) {
    where("name LIKE ?", "%#{query}%")
  }

  scope :with_department_id, ->(department_id) {
    where(department_id: department_id)
  }

  scope :search_designation, ->(designation) {
    where("designation LIKE ?", "%#{designation}%")
  }

  scope :with_department_id_advanced, ->(department_id) {
   where(department_id: department_id) if department_id.present?
 }

 scope :search_designation_advanced, ->(designation) {
   where("designation LIKE ?", "%#{designation}%") if designation.present?
 }
end
