class School < ApplicationRecord
  belongs_to :director
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :phone, presence: true, format: { with: /(?:(?:\+|00)33|0)\s*[1-9](?:[\s.-]*\d{2}){4}/ }
end
