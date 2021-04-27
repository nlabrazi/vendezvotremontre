class WatchesController < ApplicationController
  skip_before_action :authenticate_user!, only: :new

  def new
    if current_user != nil
      @user = current_user
      @last_name = current_user.last_name
      @first_name = current_user.first_name
      @email = current_user.email
      @phone = current_user.phone
    end
    @watch = Watch.new
  end

  def create
    @watch = Watch.new(watch_params)
    @watch.user = current_user
    if @watch.save
      flash.notice = "Nous connaissons cette montre, passons à la suite!"
      redirect_to dashboard_index_path
    else
      flash.alert = "Une erreur est survenue #{@watch.errors.messages}"
      redirect_to root_path
    end
  end

  def set_watch
    @watch = Watch.find(params[:id])
  end

  def watch_params
    params.require(:watch).permit(:model_id, :brand_id, :condition_id, :scope_id)
  end

end
