class Classroom < ApplicationRecord
  belongs_to :school
  belongs_to :main_teacher, class_name: 'User'
  has_many :reviews
  has_many :assignments

  validates :level, presence: true
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, if: :will_save_change_to_address?
end
