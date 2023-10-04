class EventCommentPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def create?
    user
  end

  def destroy?
    record.event.creator == user || record.author == user
  end
end
