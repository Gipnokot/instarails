class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def update?
    user_is_owner?
  end

  def destroy?
    user_is_owner?
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      user.present? ? scope.all : scope.none
    end
  end

  private

  def user_is_owner?
    user.present? && record.user == user
  end
end
