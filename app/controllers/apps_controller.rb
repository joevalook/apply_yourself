class AppsController < ApplicationController
  before_action :authorize
  
  def index
    @apps = current_user.apps.order(created_at: :desc)
  end

  def show
  @app = App.find params[:id]
  
    #1. First way by which we use the ID's to get the information
    # @company = Company.find_by(id: @app[:company_id])

    #2. Way is to use the relationship
    # puts @app.company.id
    # puts @app.company.company_name
    # puts @app.company.company_notes

  #@company 
  #need to select company based on whats linked in app
  end
  def new
    @app = App.new
  end
  def create
    @app = App.new(company_id: params[:company_id], job_title: params[:job_title], resume: params[:resume], cover_letter:params[:cover_letter], project: params[:project], project_deadline: params[:project_deadline], applied_date: params[:applied_date], application_status: params[:application_status], user_id: current_user.id, notes: params[:notes])
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

