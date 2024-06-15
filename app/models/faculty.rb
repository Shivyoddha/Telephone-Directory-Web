class Faculty < ApplicationRecord
  rails_admin do
    label "All_Data"
  end

  belongs_to :department
  # belongs_to :unit
  belongs_to :designation
  belongs_to :sub_directory, optional: true
  belongs_to :position1, class_name: 'Position', foreign_key: 'position1_id', optional: true
  belongs_to :position2, class_name: 'Position', foreign_key: 'position2_id', optional: true
  validates :name, presence: true
  validates :landline_office_intercom, presence: true
  validates :custom_order, presence: true, numericality: { only_integer: true }

  has_one_attached :profile

  def delete_profile=(value)
    profile.purge if value == '1'
  end

  def delete_profile
    false
  end


  def image_url
    if profile.attached?
      Rails.application.routes.url_helpers.rails_blob_url(profile, only_path: false, host: "telephone.nitk.ac.in")
    else
      nil
    end
  end

  filterrific(
    available_filters: [
      :search_query,
      :with_department_id,
      :search_designation,
      :search_designation_advanced,
      :with_department_id_advanced,
      :sub_directory_id_advanced
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

 scope :sub_directory_id_advanced, ->(sub_directory_id) {
  joins(:sub_directory).where("sub_directories.id = ?", sub_directory_id) if sub_directory_id.present?
}
end
