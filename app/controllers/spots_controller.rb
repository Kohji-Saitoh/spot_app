class SpotsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :search

  def search
    @q = Spot.ransack(params[:q])
    @q.combinator = 'or'
  end

  def index
    @spots = @q.result(distinct: true)
  end
  
  def new
    @spot = Spot.new
  end
    
  def create
    @spot = Spot.new(spots_params)
    if @spot.save
        flash[:notice] = 'スポット登録が完了しました。'
        redirect_to "/spots/#{@spot.id}"
    else
        render('spots/new')
    end
  end

  def destroy
    @spot = current_user.spots.find_by(id: params[:id])
    @spot.destroy
    redirect_to "/"
  end

  def show
    @spot = Spot.find_by(id: params[:id])
    @comments = @spot.comments
    if user_signed_in?
      @comment = current_user.comments.new
    end
  end

  def edit
    @spot = Spot.find_by(id: params[:id])
  end

  def update
    @spot = Spot.find_by(id: params[:id])
    if @spot.update(spots_params)
      flash[:notice] = 'スポット編集が完了しました。'
      redirect_to "/spots/#{@spot.id}"
    else
      render('spots/edit')
    end
  end

  private
  def spots_params
    params.require(:spot).permit(:name, :content, :region_id, :image).merge(user_id: current_user.id)
  end
end
