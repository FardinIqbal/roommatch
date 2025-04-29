class MatchesController < ApplicationController
  before_action :authenticate_user!

  def index
    my_likes = current_user.sent_swipes.where(liked: true).pluck(:swiped_id)
    their_likes = current_user.received_swipes.where(liked: true).pluck(:swiper_id)

    matched_ids = my_likes & their_likes

    @matches = User.where(id: matched_ids)
  end
end
