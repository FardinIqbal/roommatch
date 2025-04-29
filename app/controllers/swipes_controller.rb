class SwipesController < ApplicationController
  before_action :authenticate_user!

  def show
    # Find the next user to swipe on
    @user_to_swipe = User.where.not(id: current_user.id)
                         .where.not(id: current_user.sent_swipes.select(:swiped_id))
                         .first
  end

  def create
    swiped_user = User.find(params[:swiped_id])
    Swipe.create!(
      swiper: current_user,
      swiped: swiped_user,
      liked: params[:liked] == 'true'
    )

    if params[:liked] == 'true' && Swipe.exists?(swiper: swiped_user, swiped: current_user, liked: true)
      flash[:notice] = "🎉 It's a Match!"
    end

    redirect_to swipe_path
  end
end
