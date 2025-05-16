class LikePolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def destroy?
    user_is_owner?
  end

  private

  def user_is_owner?
    user.present? && record.user_id == user.id
  end
end
