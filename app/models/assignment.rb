class Assignment < ApplicationRecord
  belongs_to :rectorat
  belongs_to :user, optional: true
  belongs_to :classroom
  has_one :school, through: :classroom

  validates :start_date, presence: true
  validates :end_date, presence: true

  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode

  def duration
    (end_date - start_date).to_i
  end

  def prime
    (prime_per_day * duration)
  end

  def indemnite_km
    (indemnite_km_per_day * duration)
  end

  def distance
    user.distance(school)
  end

  def prime_per_day
    case school.specification.to_s.upcase
    when "REP"
      4.80
    when "REP+"
      12.90
    else
      0
    end
  end

  def indemnite_km_per_day
    km = distance
    if km == 0
      0
    elsif km < 10
      15.38
    elsif km < 19
      20.02
    elsif km < 29
      24.66
    elsif km < 39
      28.97
    elsif km < 49
      34.40
    elsif km < 59
      39.88
    elsif km < 80
      45.66
    elsif km >= 80
      45.66 + (km - 80).fdiv(20) * 6.81
    else
      "L'indemnité est incalculable"
    end
  end
end
