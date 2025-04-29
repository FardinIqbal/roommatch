class SwipesController < ApplicationController
  before_action :authenticate_user!

  # GET /swipes
  def show
    # Find the next user the current user has not already swiped on
    @user_to_swipe = User.where.not(id: current_user.id)
                         .where.not(id: current_user.sent_swipes.select(:swiped_id))
                         .first
  end

  # POST /swipes
  def create
    swiped_user = User.find(params[:swiped_id])

    Swipe.create!(
      swiper: current_user,
      swiped: swiped_user,
      liked: params[:liked] == 'true'
    )

    if params[:liked] == 'true' && Swipe.exists?(swiper: swiped_user, swiped: current_user, liked: true)
      flash[:notice] = "It’s a match! You and #{swiped_user.name} liked each other."
    else
      flash[:notice] = "Swipe recorded successfully."
    end

    redirect_to root_path
  end
end
