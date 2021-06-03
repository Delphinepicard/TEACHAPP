class School < ApplicationRecord
  belongs_to :director
  has_many :classrooms

  validates :name, presence: true
  validates :phone, presence: true, format: { with: /(?:(?:\+|00)33|0)\s*[1-9](?:[\s.-]*\d{2}){4}/ }

  has_many :school_users
  has_many :users, through: :school_users

  has_many :school_users_attached, -> { where(attachment: true) }, class_name: 'SchoolUser'
  has_many :users_attached, through: :school_users_attached, source: :user

  geocoded_by :address
end
