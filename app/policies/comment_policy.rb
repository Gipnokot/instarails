class CommentPolicy < ApplicationPolicy
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
      scope.all
    end
  end

  private

  def user_is_owner?
    user.present? && record.user_id == user.id
  end
end
