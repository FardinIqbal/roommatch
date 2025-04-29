class FiltersController < ApplicationController
  before_action :authenticate_user!

  def edit
    # Load filters from session or set default filters
    @filters = session[:filters] || {}
  end

  def update
    # Save the selected filters in session
    session[:filters] = params.require(:filters).permit(:school, :clean, :sleep_schedule)

    redirect_to root_path, notice: "Filters updated!"
  end
end
