class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_and_belongs_to_many :departments, join_table: 'users_departments'
  has_paper_trail
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true
  has_paper_trail

  def admin?
    admin
  end

  def super_admin?
    super_admin
  end
end
