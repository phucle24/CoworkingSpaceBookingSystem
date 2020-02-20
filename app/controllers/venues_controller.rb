class VenuesController < ApplicationController
  before_action :admin_account, only: [:update]
  before_action :corret_venue, only: :destroy
  before_action :load_venue, only: [:show, :edit, :update, :destroy]

  def new
    @venue = current_user.venues.build
    @venue.amenities.build
    @venue.build_address
  end

  def create
    @venue = current_user.venues.build venue_params
    if @venue.save
      flash[:info] = t ".add_venue_success"
      redirect_to venue_path @venue
    else
      render :show
    end
  end

  def index
    @venue_rows = current_user.venues.joins(:address)
    @venue_amenity = Amenity.joins(:venue)
  end

  def show; end

  def edit; end

  def update
    if @venue.update venue_params
      flash[:success] = t ".update_venue_success"
      redirect_to venue_path @venue
    else
      render :edit
    end
  end

  def destroy
    @venue.destroy
    flash[:success] = "Venue deleted"
    redirect_to venues_path
  end

  private

  def venue_params
    params.require(:venue).permit :name,
                                  amenities_attributes: [:id, :name, :_destroy],
                                  address_attributes: [:id, :name, :city]
  end

  def load_venue
    @venue = current_user.venues.find_by id: params[:id]
    return if @venue

    flash[:alert] = t ".venue_notexist"
    redirect_to root_path
  end

  def corret_venue
    @venue = current_user.venues.find_by(id: params[:id])
    redirect_to root_url if @venue.nil?
  end
end
