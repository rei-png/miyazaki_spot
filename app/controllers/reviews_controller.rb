class ReviewsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def new
    @review = current_user.reviews.build
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      flash[:success] = '正常に投稿されました'
      redirect_to root_url
    else
      @review = current_user.reviews.order(id: :desc).page(params[:page])
      flash.now[:danger] = '投稿されませんでした'
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:success] = "正常に更新されました"
      redirect_to root_url
    else
      flash.now[:danger] = "更新されませんでした"
      render :edit
    end
  end

  def destroy
    @review.destroy
    flash[:success] = "口コミを削除しました。"
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def review_params
    params.require(:review).permit(:title, :review_star, :content)
  end
  
  def correct_user
    @review = current_user.reviews.find_by(id: params[:id])
    unless @review
      redirect_to root_url
    end
  end
end
