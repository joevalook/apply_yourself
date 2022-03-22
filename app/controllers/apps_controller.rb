class AppsController < ApplicationController
  before_action :authorize
  
  def index
    @apps = App.all.order(created_at: :desc)
  end

  def show
  @app = App.find params[:id]
  end
  

end