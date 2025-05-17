class UserPolicy < ApplicationPolicy
  def follow?
    user.present? && user != record
  end
end
