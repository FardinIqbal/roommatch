class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_match             # finds user + mutual-match guard

  def index
    @messages     = Message.between_users(current_user, @match).order(:created_at)
    @new_message  = Message.new
  end

  def create
    @new_message = Message.new(
      sender:   current_user,
      receiver: @match,
      body:     params.dig(:message, :body).to_s.strip
    )

    if @new_message.save
      respond_to do |format|
        format.turbo_stream   # broadcasts handled in model
        format.html { redirect_to user_messages_path(@match) }
      end
    else
      redirect_to user_messages_path(@match), alert: "Message cannot be blank."
    end
  end

  private

  def set_match
    @match = User.find_by(id: params[:user_id])

    unless @match && current_user.mutual_matches.include?(@match)
      redirect_to root_path, alert: "You are not matched with that user."
    end
  end
end
