class Review < ApplicationRecord
  belongs_to :user
  belongs_to :classroom
  attr_accessor :assignment
end
