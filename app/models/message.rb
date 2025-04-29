class Message < ApplicationRecord
  belongs_to :sender,   class_name: "User"
  belongs_to :receiver, class_name: "User"

  # handy scope for controller
  scope :between_users, ->(u1, u2) do
    where(sender: [u1, u2], receiver: [u1, u2])
  end

  # Turbo-broadcast to **both** users after create
  after_create_commit :broadcast_message

  private

  def broadcast_message
    # one stream per participant → no leaks
    [sender, receiver].each do |u|
      broadcast_append_to(
        [u, receiver == u ? sender : receiver],      # stream name  [viewer, partner]
        target:  "messages",                         # <div id="messages">
        partial: "messages/message",
        locals:  { message: self, local_user: u }
      )
    end
  end
end
