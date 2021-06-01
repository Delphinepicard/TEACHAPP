class SchoolUser < ApplicationRecord
  belongs_to :user
  belongs_to :school
  validates :attachment, presence: true
end
