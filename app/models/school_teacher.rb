class SchoolTeacher < ApplicationRecord
  belongs_to :teacher
  belongs_to :school
  validates :attachment, presence: true
end
