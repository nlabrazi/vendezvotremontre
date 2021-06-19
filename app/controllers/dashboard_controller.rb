class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @watches = @user.watches
    @bookings = @user.bookings
    #@condition = condition.name
  end

end
