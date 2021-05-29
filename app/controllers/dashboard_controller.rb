class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @watches = current_user.watches
    @bookings = current_user.bookings
  end

end
