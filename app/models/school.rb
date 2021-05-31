class School < ApplicationRecord
  belongs_to :director

  has_many :classrooms
end
