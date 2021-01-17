class WatchesController < ApplicationController

  def new
    @watch = Watch.new
    @watch.brand = brand_id
    @watch.model = model_id
  end

  def create

  end

  def set_watch
    @watch = Watch.find(params[:id])
  end

  def watch_params
    params.require(:watch).permit(:model_id)
  end

end
