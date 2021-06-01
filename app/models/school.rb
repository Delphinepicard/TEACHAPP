class School < ApplicationRecord
  belongs_to :director
  has_many :classrooms
  has_many :school_users

  validates :name, presence: true
  validates :phone, presence: true, format: { with: /(?:(?:\+|00)33|0)\s*[1-9](?:[\s.-]*\d{2}){4}/ }
end
