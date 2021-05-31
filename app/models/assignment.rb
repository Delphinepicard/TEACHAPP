class Assignment < ApplicationRecord
  belongs_to :rectorat
  belongs_to :teacher
  belongs_to :classroom
end
