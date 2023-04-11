class User < ApplicationRecord
  has_many :spots, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def liked?(spot)
    self.likes.exists?(spot_id: spot.id)
  end
end
