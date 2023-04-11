class Spot < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :region
  has_many :likes, dependent: :destroy
  
  validates :name, presence: true
  validates :content, presence: true
  validates :region_id, presence: true, numericality: {greater_than: 1}
end
