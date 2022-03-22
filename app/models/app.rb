class App < ApplicationRecord

  belongs_to :company
  has_one :user
  has_many :interviews

  validates_presence_of :job_title, :resume, :applied_date, :application_status
 
  def self.get_interviews
    interviews = App.joins(:interviews).select('*')
  end

end