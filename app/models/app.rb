class App < ApplicationRecord

  belongs_to :company
  belongs_to :user
  has_many :interviews

  validates_presence_of :job_title, :resume, :applied_date, :application_status

  def self.get_interviews
    interviews = App.joins(:interviews).select('*')
  end

  def upcoming_interviews(this_date: Time.now)
    self.interviews.select do |interview|
      interview.interview_date > this_date
    end
  end

  def upcoming_interviews?(this_date: Time.now)
    upcoming_interviews(this_date: this_date).any?
  end

  def next_interview
    upcoming_interviews.sort_by { |interview| interview.interview_date }.first
  end
end