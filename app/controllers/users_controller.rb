class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update]
  
  def show
    @reviews = @user.reviews.order(id: :desc).page(params[:page]).per(3)
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
  end

  def update
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
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :birth_year, :email, :password, :password_confirmation, :user_image, :remove_user_image)
  end
end
