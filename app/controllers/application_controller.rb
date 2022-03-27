class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  default_form_builder BulmaFormBuilder

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end

  def route_finder(app_id)
    # total_interviews = Interview.select('*').where(app_id: app_id)
    total_interviews = App.find(app_id).interviews
    # today = Date.today

    total_interviews.select do |interview|
      interview.interview_date > Time.now
    end.sort_by { |interview| interview.interview_date }.first
    
    # today = Time.now
    # future_interviews = []
    # total_interviews.each do |interview|
    #   if interview.interview_date > today
    #     future_interviews.push(interview)
    #   end
    # end
    # future_interviews.sort.first
  end

  helper_method :route_finder

  def interview_finder(app_id)
    all_interviews = Interview.select('*').where(app_id: app_id)
  end

  def all_companies
    # apps = current_user.apps
    # a = []
    # apps.each do |app| 
    #   a << Company.select('*').where(id: app.company_id)
    # end
    # return a

    current_user.apps.map do |app|
      app.company
    end.uniq.sort_by do |company|
      company.company_name
    end
  end

  def interview_completed(interview)
    if interview.interview_date>Date.today
      return false
    else
      return true
    end
  end
  helper_method :interview_finder, :interview_completed, :all_companies

    #hello
  # def company_finder(app_id)
  # all_companies = Company.select('*').where(company_id: company_id)
  # end
  # helper_method :company_finder

end