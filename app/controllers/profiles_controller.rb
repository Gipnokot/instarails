class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :authorize_user

  def show; end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to profile_path, notice: "Profile was updated"
    else
      render :edit
    end
  end

  private

  def set_user
    @user = current_user
  end

  def authorize_user
    authorize @user, policy_class: ProfilePolicy
  end

  def user_params
    params.require(:user).permit(:avatar, :username, :bio)
  end
end
