class WatchesController < ApplicationController

  def new
    @watch = Watch.new
  end

end
