class App < ApplicationRecord

  belongs_to :company
  has_one :user
  has_many :interviews

end