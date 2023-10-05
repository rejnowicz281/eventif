class EventPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def create?
    user
  end

  def update?
    is_creator?
  end

  def destroy?
    is_creator?
  end

  def end?
    is_creator?
  end

  def resume?
    is_creator?
  end

  def make_private?
    is_creator?
  end

  def make_public?
    is_creator?
  end

  private
  def is_creator?
    record.creator == user
  end
end
