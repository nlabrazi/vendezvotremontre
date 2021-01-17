class WatchesController < ApplicationController

  def new
    @watch = Watch.new(watch_params)
    # @brand = Brand.find(params[:brand_id])
  end

  def create
    @watch = Watch.find(params[:watch_id])
    if @watch.save
      # Deliver the signup email
      #NotificationMailer.create_project(@estimate).deliver
      #redirect_to watch_path(@watch, :notice => 'RDV créé')
      redirect_to root_path :notice => 'RDV Créé'
    else
      #redirect_to watch_path(@watch, :notice => 'Echec de la création de RDV')
      redirect_to root_path :notice => 'Echec de la création de RDV'
    end
  end

  def set_watch
    @watch = Watch.find(params[:id])
  end

  def watch_params
    params.require(:watch).permit(:model_id)
  end

end
