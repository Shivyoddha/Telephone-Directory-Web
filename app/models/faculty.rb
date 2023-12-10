class Faculty < ApplicationRecord
  belongs_to :department
  has_one_attached :profile
  
  filterrific(
   available_filters: [
     :search_query,
     :with_department_id,
   ]
 )

 scope :search_query, ->(query) {
   where("name LIKE ?", "%#{query}%")
 }

 scope :with_department_id, ->(department_id) {
   where(department_id: department_id)
 }

end
