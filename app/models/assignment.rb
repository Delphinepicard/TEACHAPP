class Assignment < ApplicationRecord
  belongs_to :rectorat
  belongs_to :teacher
  belongs_to :classroom

  validates :start_date, presence: true
  validates :end_date, presence: true
end
