class App < ApplicationRecord

  belongs_to :company
  belongs_to :user
  has_many :interviews
  has_one_attached :resume

  validates_presence_of :job_title, :resume, :applied_date, :application_status

  def self.get_interviews
    interviews = App.joins(:interviews).select('*')
  end

end