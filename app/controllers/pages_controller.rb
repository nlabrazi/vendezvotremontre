class PagesController < ApplicationController

  def home
    @brands = Brand.all
    @models = Model.where("brand_id = ?", Brand.first.id)
  end

  def show
    @model = Model.find_by("id = ?", params[:model_id])
  end

  def update_models
    @models = Model.where("brand_id = ?", params[:brand_id])
    respond_to do |format|
      format.js { render partial: 'update-models' }
    end
  end

end
