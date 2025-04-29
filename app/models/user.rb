class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations for swiping
  has_many :sent_swipes, class_name: "Swipe", foreign_key: "swiper_id", dependent: :destroy
  has_many :received_swipes, class_name: "Swipe", foreign_key: "swiped_id", dependent: :destroy
  has_one_attached :avatar
end
