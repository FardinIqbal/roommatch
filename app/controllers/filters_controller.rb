class FiltersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(filter_params)
      redirect_to swipes_path, notice: "Filters updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def filter_params
    params.require(:user).permit(
      :filter_same_school,
      :filter_smoking,
      :filter_clean,
      :filter_sleep
    )
  end
end
