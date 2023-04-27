class User < ApplicationRecord
  has_many :spots, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, on: :create

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def liked?(spot)
    self.likes.exists?(spot_id: spot.id)
  end
end
