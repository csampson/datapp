class AppsController < ApplicationController

  def index
    @apps = App.published.order('created_at DESC')
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
      AdminMailer.app_submitted(@app).deliver
      #redirect_to @app, notice: 'App was successfully created.'
      render action: "confirmation"
    else
      render action: "new"
    end
  end

  def confirmation
  end

end
