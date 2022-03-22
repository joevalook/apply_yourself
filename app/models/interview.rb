class Interview < ApplicationRecord

  belongs_to :app
  validates_presence_of :job_title, :title, :resume, :company_name, :date_applied, :application_status

end
