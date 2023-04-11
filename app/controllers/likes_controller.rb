class LikesController < ApplicationController

  def create
    @like = current_user.likes.create(spot_id: params[:spot_id])
    redirect_back(fallback_location: root_path )
  end

  def destroy
    @like = current_user.likes.find_by(spot_id: params[:spot_id])
    @like.destroy
    redirect_back(fallback_location: root_path )
  end
  
end
