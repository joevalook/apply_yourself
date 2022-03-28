class CompaniesController < ApplicationController
  def index
  end

  def new
    @company = Company.new
  end
  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:success] = "New company successfully added!"
      redirect_to "/companies/#{@company.id}/apps/new"
    else
      flash.now[:error] = "company creation failed"
      render :new
    end
  end
  def edit
    @company = Company.find(params[:id])
    session[:return_to] ||= request.referer
  end
  def update
    @company = Company.find(params[:id])

    if @company.update(company_params)
      redirect_to session.delete(:return_to)
    else
      render :edit
    end
  end

  private

  def company_params
    params.require(:company).permit(:company_name, :website, :company_notes)
  end
end
