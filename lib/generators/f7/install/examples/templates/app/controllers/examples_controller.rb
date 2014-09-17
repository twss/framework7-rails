class ExamplesController < ApplicationController
  def index
  end

  def about
  	render :layout => false
  end

  def form
  	render :layout => false
  end

  def services
  	render :layout => false
  end
end
