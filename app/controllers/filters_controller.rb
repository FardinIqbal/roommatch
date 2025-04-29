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

  def reset
    current_user.update!(
      filter_same_school: false,
      filter_smoking: nil,
      filter_clean: nil,
      filter_sleep: nil,
      filter_keywords: nil
    )
    redirect_to edit_filters_path, notice: "Filters reset to default."
  end

  private

  def filter_params
    params.require(:user).permit(
      :filter_same_school,
      :filter_smoking,
      :filter_clean,
      :filter_sleep,
      :filter_keywords
    )
  end
end
