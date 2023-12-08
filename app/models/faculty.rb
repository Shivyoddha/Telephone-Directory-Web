class Faculty < ApplicationRecord
  has_many :achievements
  has_many :academic_backgrounds
  has_many :publications
  has_many :significant_projects
  has_many :interests
  belongs_to :department
  filterrific(
   available_filters: [
     :search_query,
     :with_department_id,
     :with_interest_ids
     # Add other filters as needed
   ]
 )

 # Your model code here...

 scope :search_query, ->(query) {
   where("name LIKE ?", "%#{query}%")
 }

 scope :with_department_id, ->(department_id) {
   where(department_id: department_id)
 }

 scope :with_interest_ids, ->(interest_ids) {
   joins(:interests).where(interests: { id: interest_ids })
 }

end
