class BookingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    @watch = Watch.find(params[:watch_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.status = "en attente"
      if @booking.save
        NotificationMailer.create_booking(@booking).deliver
        flash[:notice] = "Super! Votre RDV a été pris."
        redirect_to dashboard_index_path
      else
        flash[:alert] = "Oups! Une erreur est survenue. #{@booking.errors.messages}"
        redirect_to dashboard_index_path
      end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_time, :watch_id, :user_id)
  end

end
