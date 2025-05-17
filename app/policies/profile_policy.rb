class ProfilePolicy < ApplicationPolicy
  def show?
    true
  end

  def edit?
    user_is_owner?
  end

  def update?
    user_is_owner?
  end

  private

  def user_is_owner?
    user.present? && record.id == user.id
  end
end
