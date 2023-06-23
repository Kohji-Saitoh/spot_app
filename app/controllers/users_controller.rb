class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @likes = Like.where(user_id: current_user.id).pluck(:spot_id)
    @spots_like = Spot.where(id: @likes)
    @spots_create = Spot.where(user_id: current_user.id)
  end
end
