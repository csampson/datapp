class AppsController < ApplicationController

  def index
    @apps = App.published
  end

  def show
    @app = App.find(params[:id])
  end

  def new
    @app = App.new
  end

  def create
    params.delete :published
    @app = App.new(params[:app])

    if @app.save
      redirect_to @app, notice: 'App was successfully created.'
    else
      render action: "new"
    end
  end

end
