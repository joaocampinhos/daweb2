class StaticController < ApplicationController
  def about
    render :layout => false
  end
end
