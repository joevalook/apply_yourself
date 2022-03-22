class AppsController < ApplicationController
  before_action :authorize
  
  def index
    @apps = current_user.apps.order(created_at: :desc)
  end

  def show
  @app = App.find params[:id]
  end
  

end