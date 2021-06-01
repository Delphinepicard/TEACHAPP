class Rectorat < ApplicationRecord
  has_many :assignments

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true
end
