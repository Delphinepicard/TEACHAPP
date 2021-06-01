class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :assignments
  has_many :reviews
  has_many :school_users
  has_many :schools, through: :school_users
  has_many :classrooms, through: :assignments

  has_one :attached_school_user, -> { where(school_users: { attachment: true }) }, class_name: 'SchoolUser'
  has_one :attached_school, through: :attached_school_user, source: :school
end
