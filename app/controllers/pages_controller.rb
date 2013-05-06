class PagesController < ApplicationController
  before_filter :authenticate!, except: [:home]

  def home
    render :layout => "home"
  end
end
