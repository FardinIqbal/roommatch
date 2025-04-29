class SwipesController < ApplicationController
  before_action :authenticate_user!

  # GET /swipes
  def show
    # Get users the current user hasn't swiped on
    potential_matches = User.where.not(id: current_user.id)
                            .where.not(id: current_user.sent_swipes.select(:swiped_id))

    # Apply filters
    if current_user.filter_same_school?
      potential_matches = potential_matches.where(school: current_user.school)
    end

    if current_user.filter_smoking == true
      potential_matches = potential_matches.where(smoking: false)
    elsif current_user.filter_smoking == false
      potential_matches = potential_matches.where(smoking: true)
    end

    if current_user.filter_clean == true
      potential_matches = potential_matches.where(clean: true)
    elsif current_user.filter_clean == false
      potential_matches = potential_matches.where(clean: false)
    end

    if current_user.filter_sleep.present? && current_user.filter_sleep != "any"
      potential_matches = potential_matches.where(sleep_schedule: current_user.filter_sleep)
    end

    @user_to_swipe = potential_matches.first
  end

  # POST /swipes
  def create
    swiped_user = User.find(params[:swiped_id])
    liked = params[:liked] == 'true'

    begin
      Swipe.create!(
        swiper: current_user,
        swiped: swiped_user,
        liked: liked
      )

      if liked && Swipe.exists?(swiper: swiped_user, swiped: current_user, liked: true)
        flash[:notice] = "It’s a match! You and #{swiped_user.name} liked each other."
      else
        flash[:notice] = "Swipe recorded successfully."
      end

    rescue ActiveRecord::RecordNotUnique
      flash[:alert] = "You’ve already swiped on this user."
    end

    redirect_to root_path
  end
end
