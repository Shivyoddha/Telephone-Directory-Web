class Complaint < ApplicationRecord
  validates :telephone, presence: true
  validates :kind, presence: true
  
  scope :resolved, -> { where("status = ? OR bsnlstatus = ?", true, true) }
  scope :unresolved, -> { where(status: false, bsnlstatus: false) }
  
  def resolution_time
    return nil unless resolved?
    if status_changed_at.present? && bsnlstatus_changed_at.present?
      [status_changed_at, bsnlstatus_changed_at].min - created_at
    elsif status_changed_at.present?
      status_changed_at - created_at
    elsif bsnlstatus_changed_at.present?
      bsnlstatus_changed_at - created_at
    end
  end
  
  def resolved?
    status || bsnlstatus
  end
end
