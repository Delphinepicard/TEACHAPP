class Teacher < ApplicationRecord
  has_many :assignments
  has_many :reviews
  has_many :school_teachers
  has_many :schools, through: :school_teachers

  has_one :attached_school_teacher, -> { where(school_teachers: { attachment: true }) }, class_name: 'SchoolTeacher'
  has_one :attached_school, through: :attached_school_teacher, source: :school
end
