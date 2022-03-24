class AppsController < ApplicationController
  before_action :authorize
  
  def index
    @apps = current_user.apps.order(created_at: :desc)
  end

  def show
  @app = App.find(params[:id])
  @interview = Interview.new

  
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
    @company_id = params[:company_id]
  end
  def create
    puts params.inspect
    @app = App.new(app_params)
    @app.company_id = params[:company_id]
    @app.user_id = current_user.id
    if @app.save!
      flash[:success] = "New app successfully added!"
      redirect_to '/'
    else
      flash.now[:error] = "app creation failed"
      render :news
    end
  end
 
  def edit
    @app = App.find(params[:id])
  end

  def update
    @app = App.find(params[:id])

    if @article.update(app_params)
      redirect_to :show
    else
      render :edit
    end
  end

  private

  def app_params
    params.require(:app).permit(:job_title, :resume, :cover_letter, :project, :project_deadline, :applied_date, :application_status, :notes)
  end
  
  #user_id: current_user.id ompany_id: params[:company_id]

end

