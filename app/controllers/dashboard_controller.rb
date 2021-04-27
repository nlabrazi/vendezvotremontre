class DashboardController < ApplicationController
  before_action :authenticate_user!
#  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    @watches = current_user.watches
  end

end
