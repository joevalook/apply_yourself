class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end
  def create
    @company = Company.new(params.require(:company).permit(:company_name, :website, :company_notes))
    if @company.save
      flash[:success] = "New company successfully added!"
      redirect_to "/companies/#{@company.id}/apps/new"
    else
      flash.now[:error] = "company creation failed"
      render :new
    end
  end
  def edit
  end
  def update
  end
end
