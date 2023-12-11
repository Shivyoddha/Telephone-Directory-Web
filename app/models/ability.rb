# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    Rails.logger.debug("User: #{user.inspect}")
    
    if user.super_admin?
      can :manage, :all
    elsif user.admin?
      can :access, :rails_admin
      can :read, :dashboard
      can :manage, Department, id: user.department_id
      can :manage, Faculty, department: { id: user.department_id }
    end
  end
end
