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
  has_one :classroom, foreign_key: :main_teacher_id

  has_one_attached :photo

  # validates :last_name, presence: true
  # validates :first_name, presence: true
  # validates :phone, presence: true, format: { with: /(?:(?:\+|00)33|0)\s*[1-9](?:[\s.-]*\d{2}){4}/ }
end
