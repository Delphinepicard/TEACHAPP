class Classroom < ApplicationRecord
  belongs_to :school

  has_many :reviews
  has_many :assignments
end
