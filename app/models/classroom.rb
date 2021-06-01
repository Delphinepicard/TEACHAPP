class Classroom < ApplicationRecord
  belongs_to :school
  has_many :reviews
  has_many :assignments

  validates :level, presence: true
end
