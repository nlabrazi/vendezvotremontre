class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :faq, :mentions, :contact]

  def home
    @watch = Watch.new
  end

  def faq
  end

  def mentions
  end

  def contact
  end

end
