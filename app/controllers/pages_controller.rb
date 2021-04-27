class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @watch = Watch.new
  end

end
