class WatchesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def index
    @watch = Watch.find(params[:id])
    @booking = Booking.new
    @bookings = Booking.where(watch_id: @watch.id)
  end

  def new
    @brands = Brand.all
    @models = []
    @watch = Watch.new
    if current_user != nil
      @user = current_user
      @phone = current_user.phone
      @email = current_user.email
      @first_name = current_user.first_name
    end
    #   @user = User.create(
    #     :phone => params[:temp_phone],
    #     :email => params[:temp_email],
    #     :first_name => params[:temp_first_name],
    #     :password => "coucou"
    #     )
    # end
    if params[:brand].present?
      @models = Brand.find(params[:brand]).models
    end
    if request.xhr?
      respond_to do |format|
        format.json {
          render json: {models: @models}
        }
      end
    end
  end

  def create
    if current_user == nil
      @user = User.create(
        phone: params[:watch][:temp_phone],
        email: params[:watch][:temp_email],
        first_name: params[:watch][:temp_first_name],
        password: "coucou"
        )
      if @user.save
        @watch = Watch.new(watch_params)
        @watch.user = User.last
      else
        puts "#{@user.errors.messages}"
        puts "#{@user.errors.messages}"
        puts "#{@user.errors.messages}"
      end
    else
      @watch = Watch.new(watch_params)
      @watch.user = current_user
    end
    #@watch = Watch.new(watch_params)
    #@watch.user = current_user
    if @watch.save && current_user !=nil
      flash.notice = "Nous connaissons cette montre, passons à la suite!"
      redirect_to dashboard_index_path
    elsif
      @watch.save && current_user == nil
      flash.notice = "Nous connaissons cette montre, veuillez vous connecter pour continuer"
      redirect_to root_path
    else
      flash.alert = "Une erreur est survenue #{@watch.errors.messages}"
      redirect_to root_path
    end
  end

  def set_watch
    @watch = Watch.find(params[:id])
  end

  def watch_params
    params.require(:watch).permit(:model_id, :brand_id, :condition_id, :scope_id, :temp_email, :temp_phone, :temp_first_name)
  end

end
