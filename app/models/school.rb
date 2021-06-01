class School < ApplicationRecord
  belongs_to :director

  has_many :classrooms
  has_many :school_users
end
