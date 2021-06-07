ap "je usi sla"

Review.delete_all
Assignment.delete_all
Classroom.delete_all
SchoolUser.delete_all
User.delete_all
School.delete_all
Director.delete_all
Rectorat.delete_all


recto = Rectorat.create!(first_name: "toto", last_name: 'titi', email: 'titi@recto.org')

main_teacher = User.create!(
    :email => "main_teacher@gmail.com",
    :password => "azerty",
    :first_name => "main_teacher",
     :last_name => "main_teacher",
         :phone => "0644772221",
         :level => "GSM",
    :specification => "REP+"
  )

jaures  = School.create!(name: 'Ecole maternelle Jaurès', address: '4 rue du Colonel Marey 42500 LE CHAMBON FEUGEROLLES', phone: '0477610270', specification: 'REP', latitude: '45.395209426831215', longitude: '4.322800191508945', director: Director.create!(first_name: "Alfred", last_name: "Dupont", phone: '0622345647', email: "alfred.dupont@gmail.com")) #REP

psm = Classroom.create!(level: 'PSM', school: jaures, main_teacher: main_teacher)


7.times do |i|
  User.create!(
    :email => "email#{i}@gmail.com",
    :password => "azerty",
    :first_name => "fn#{i}",
     :last_name => "ln#{i}",
         :phone => "0644772221",
         :level => "GSM",
    :specification => "REP+"
  )
end

Assignment.create!(start_date: '05-07-2021', end_date: '06-07-2021', rectorat: recto, user: User.find_by(email: "email0@gmail.com"), classroom: psm)
Assignment.create!(start_date: '10-07-2021', end_date: '13-07-2021', rectorat: recto, user: User.find_by(email: "email0@gmail.com"), classroom: psm)
Assignment.create!(start_date: '10-07-2021', end_date: '13-07-2021', rectorat: recto, user: User.find_by(email: "email1@gmail.com"), classroom: psm)
Assignment.create!(start_date: '14-07-2021', end_date: '17-07-2021', rectorat: recto, user: User.find_by(email: "email2@gmail.com"), classroom: psm)
Assignment.create!(start_date: '10-07-2021', end_date: '17-07-2021', rectorat: recto, user: User.find_by(email: "email3@gmail.com"), classroom: psm)
Assignment.create!(start_date: '13-07-2021', end_date: '15-07-2021', rectorat: recto, user: User.find_by(email: "email4@gmail.com"), classroom: psm)
Assignment.create!(start_date: '10-07-2021', end_date: '11-07-2021', rectorat: recto, user: User.find_by(email: "email5@gmail.com"), classroom: psm)
Assignment.create!(start_date: '17-07-2021', end_date: '20-07-2021', rectorat: recto, user: User.find_by(email: "email5@gmail.com"), classroom: psm)


ap Assignment.all.map {|a| "#{a.user.email} #{a.start_date} => #{a.end_date}" }

#  belongs_to :rectorat
#   belongs_to :user, optional: true
#   belongs_to :classroom
#   has_one :school, through: :classroom

#   validates :start_date, presence: true
#   validates :end_date, presence: true

#   reverse_geocoded_by :latitude, :longitude
#   after_validation :geocode
