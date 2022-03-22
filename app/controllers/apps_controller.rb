class AppsController < ApplicationController
  before_action :authorize
  
  def index
    @apps = App.all.order(created_at: :desc)
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
  

end