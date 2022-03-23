class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end

  def route_finder(app_id)
    total_interviews = Interview.select('*').where(app_id: app_id)
    today = Date.today
    future_interviews = []
    total_interviews.each do |interview|
      if interview.interview_date > today
        future_interviews.push(interview)
      end
    end
    future_interviews.sort.first
  end

  helper_method :route_finder

  def interview_finder(app_id)
    all_interviews = Interview.select('*').where(app_id: app_id)
  end
  helper_method :interview_finder

  # def company_finder(app_id)
  # all_companies = Company.select('*').where(company_id: company_id)
  # end
  # helper_method :company_finder

end