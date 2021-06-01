class Assignment < ApplicationRecord
  belongs_to :rectorat
  belongs_to :user
  belongs_to :classroom

  has_one :school, through: :classroom
end
