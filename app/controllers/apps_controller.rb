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
    @app = App.new(company_id: params[:company_id], job_title: params[:job_title], resume: params[:resume], cover_letter:params[:cover_letter], project: params[:project], project_deadline: params[:project_deadline], applied_date: params[:applied_date], application_status: params[:application_status])
    if @app.save!
      flash[:success] = "New app successfully added!"
      redirect_to '/'
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

