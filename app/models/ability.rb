# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    Rails.logger.debug("User: #{user.inspect}")

    if user.super_admin?
      can :manage, :all
    elsif user.email === 'bsnl@nitk.edu.in'
      can :manage, Complaint
      can :access, Complaint
    else
      cannot :access, Complaint
    end

    if user.admin?
      can :access, :rails_admin
      can :read, :dashboard
      can :manage, User, id: user.id
      can :read, Department, id: user.department_ids
      can :manage, Faculty, department: { id: user.department_ids }
      can :read, Position
      can :read, Designation
      can :read, SubDirectory
      cannot :create, Department
      cannot :destroy, Department
    end

  end
end
