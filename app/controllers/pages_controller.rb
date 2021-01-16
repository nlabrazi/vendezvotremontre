class PagesController < ApplicationController

  def home
    @watch = Watch.new
  end

end
