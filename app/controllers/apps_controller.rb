class AppsController < ApplicationController
  before_action :authorize
  
  def index
  
  end

  def show
  end
  def new
    @app = App.new
  end
  def create
    @app = App.new(title: "...", body: "...")

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end
  def edit
  end
  def update
  end
  

end
