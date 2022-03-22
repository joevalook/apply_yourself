class App < ApplicationRecord

  belongs_to :company
  belongs_to :user
  has_many :interviews

  def self.get_interviews
    interviews = App.joins(:interviews).select('*')
  end

end