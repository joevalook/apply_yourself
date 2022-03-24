class Company < ApplicationRecord

  has_many :apps
  validates_presence_of :company_name

end
