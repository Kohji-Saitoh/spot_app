class User < ApplicationRecord
  has_many :spots, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
