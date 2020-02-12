class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update]

  def show
    @user = User.find_by id: params[:id]
    return if @user

    flash[:alert] = t ".user_notexist"
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t ".create_success"
      redirect_to @user
    else
      flash[:success] = t ".create_fail"
      render :new
    end
  end

  def edit; end

  def update
    if @user.update user_params
      flash[:success] = t ".update_success"
      redirect_to user_path @user
    else
      render :edit
    end
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:alert] = t ".user_notexist"
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit :name, :email, :phone, :password, :password_confirmation
  end
end
