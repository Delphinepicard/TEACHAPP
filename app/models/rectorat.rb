class Rectorat < ApplicationRecord
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true
  has_many :assignments
end
