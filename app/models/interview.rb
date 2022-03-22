class Interview < ApplicationRecord

  belongs_to :app
  validates_presence_of :interview_number, :interview_date
end

