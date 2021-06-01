class Classroom < ApplicationRecord
  belongs_to :school
  validates :level, presence: true

  has_many :reviews
  has_many :assignments
end
