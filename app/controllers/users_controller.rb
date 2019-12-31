class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :edit, :update, :destroy]
  
  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.order(id: :desc).page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    @review = Review.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      flash[:success] = "正常に更新されました。"
      redirect_to @user
    else
      flash.now[:danger] = "更新されませんでした。"
      render :edit
    end
  end

  def destroy
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :birth_year, :email, :password, :password_confirmation)
  end
end
