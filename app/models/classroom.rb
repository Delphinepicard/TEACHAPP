class Classroom < ApplicationRecord
  belongs_to :school
  belongs_to :review
  validates :level, presence: true
end
