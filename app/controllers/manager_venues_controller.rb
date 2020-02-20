class ManagerVenuesController < ApplicationController
  before_action :admin_account, only: [:edit, :update]

  def index
    @venues = Venue.all.joins(:address)
  end

  def new
    @venue = Venue.new
  end
  def edit
    @venue = Venue.find_by(id: params[:id])
  end

  def update
    if @venue.update_attributes(edit_account_params)
      flash[:success] = t('editsuccess')
      redirect_to manager_venues_path
    else
      render :index
  end

  private

  def edit_venue_params
    params.require(:venue).permit(:status)
  end

  def admin_account
    !current_user.nil? && current_user.role == "admin"
  end

  end
end
