class Classroom < ApplicationRecord
  belongs_to :school
  belongs_to :main_teacher, class_name: 'User'
  has_many :reviews
  has_many :assignments

  validates :level, presence: true
end
