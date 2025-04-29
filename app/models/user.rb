class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations for swiping
  has_many :sent_swipes, class_name: "Swipe", foreign_key: "swiper_id", dependent: :destroy
  has_many :received_swipes, class_name: "Swipe", foreign_key: "swiped_id", dependent: :destroy
  has_one_attached :avatar
  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id", dependent: :destroy
  has_many :received_messages, class_name: "Message", foreign_key: "receiver_id", dependent: :destroy

  def mutual_matches
    User
      .joins("INNER JOIN swipes AS s1 ON s1.swiped_id = users.id AND s1.liked = true")
      .joins("INNER JOIN swipes AS s2 ON s2.swiper_id = users.id AND s2.swiped_id = #{id} AND s2.liked = true")
      .where("s1.swiper_id = ?", id)
      .distinct
  end


end
