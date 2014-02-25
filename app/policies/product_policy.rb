class ProductPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope
    end
  end

  def create?
    true
  end

  def update?
    true
  end

  def destroy?
    user.admin?
  end
end
