class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @spots_create = Spot.where(user_id: current_user.id)
    @likes = Like.where(user_id: current_user.id).pluck(:spot_id)
    @spots_like = Spot.where(id: @likes)
  end
end
