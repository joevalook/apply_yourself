class AppsController < ApplicationController
  before_action :authorize
  
  def index
    @apps = App.all.order(created_at: :desc)
  end

  def show
  @app = App.find params[:id]
  end
  def new
    @app = App.new
  end
  def create
    @app = App.new(params.require(:app).permit(:job_title, :resume, :cover_letter, :project, :project_deadline, :applied_date, :application_status))
    if @app.save
      flash[:success] = "New app successfully added!"
      redirect_to '/apps/new'
    else
      flash.now[:error] = "app creation failed"
      render :new
    end
  end
  def edit
  end
  def update
  end
  

end

