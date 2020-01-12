class SpotsController < ApplicationController
  
  def index
    if params[:area] == 'takachiho'
      @spots = Spot.where(area: '高千穂')
    elsif params[:area] == 'aoshima'
      @spots = Spot.where(area: '青島・日南')
    elsif params[:area] == 'ebino'
      @spots = Spot.where(area: 'えびの・都城')
    else
      @spots = Spot.all
    end
  end
  
  def show
    @spot = Spot.find(params[:id])
    @reviews = Review.where(spot_id: params[:id]).order(id: :desc).page(params[:page]).per(3)
    @user = User.find_by(params[:id])
  end
  
end
