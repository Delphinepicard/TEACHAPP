class SchoolUser < ApplicationRecord
  belongs_to :user
  belongs_to :school
  validates :attachment, inclusion: { in: [true, false] }
end
