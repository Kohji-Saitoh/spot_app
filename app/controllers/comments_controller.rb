class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    Comment.find_by(id: params[:id]).destroy
    redirect_back(fallback_location: root_path )
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, spot_id: params[:spot_id])
  end
end
