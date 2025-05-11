class PostPolicy < ApplicationPolicy
  def index?; true; end

  def show?
    true
  end

  def create?
    user.present?
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      user.present? ? scope.all : scope.none
    end
  end

  private

  def owner?
    user.present? && record.user == user
  end
end
