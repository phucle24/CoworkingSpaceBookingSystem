class SpacesController < ApplicationController
  before_action :corret_user, only: :destroy
  before_action :load_space, only: [:show, :edit, :update]

  def new
    @space = current_user.spaces.build
    @space.build_price
  end

  def create
    @space = current_user.spaces.build space_params
    if @space.save
      flash[:info] = t ".add_space_success"
      redirect_to space_path @space
    else
      render :new
    end
  end

  def index
    @space_rows = current_user.spaces
  end

  def show; end

  def edit; end

  def update
    if @space.update space_params
      flash[:success] = t ".update_space_success"
      redirect_to space_path @space
    else
      render :edit
    end
  end

  private

  def space_params
    params.require(:space).permit :name, :description, :capacity, :hour_open, :hour_close, :status,
                                  :picture,
                                  :type_id,
                                  :venue_id,
                                  price_attributes: [:id, :per_month, :per_day, :per_hour]
  end

  def load_types
    @types = Type.all
  end

  def load_venues
    @venues = Venue.all
  end

  def load_space
    @space = current_user.spaces.find_by id: params[:id]
    return if @space

    flash[:alert] = t ".space_notexist"
    redirect_to root_path
  end

  def corret_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
