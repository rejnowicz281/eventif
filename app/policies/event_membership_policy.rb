class EventMembershipPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def create?
    user && # user is signed in
      !is_creator? && # user is not creator
      !is_member? # user is not already a member
  end

  def destroy?
    is_creator? || record.user == user # user is either event creator or the member being deleted
  end

  def accept?
    is_creator?
  end

  private

  def is_creator?
    user == record.event.creator
  end

  def is_member?
    record.event.members.include?(user)
  end
end
