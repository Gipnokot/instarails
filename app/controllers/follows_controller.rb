class FollowsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :authorize_follow, only: [:create, :destroy]

  def create
    if current_user != @user && !current_user.following.include?(@user)
      current_user.following << @user
    end
    redirect_to user_path(@user), notice: "You followed #{@user.username}"
  end

  def destroy
    if current_user.following.include?(@user)
      current_user.following.delete(@user)
    end
    redirect_to user_path(@user), alert: "You unfollowed #{@user.username}"
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def authorize_follow
    authorize @user, :follow?
  end
end
