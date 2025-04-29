class ProfilesController < ApplicationController
  before_action :authenticate_user!

  # GET /profile/edit
  def edit
    @user = current_user
  end

  # PATCH /profile
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to root_path, notice: "Profile updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  # Only allow a trusted list of parameters through
  def user_params
    params.require(:user).permit(
      :name,
      :bio,
      :school,
      :major,
      :year_in_school,
      :sleep_schedule,
      :clean,
      :hobbies,
      :guest_policy,
      :smoking,
      :pets,
      :avatar
    )
  end
end
