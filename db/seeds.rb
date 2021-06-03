# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Review.delete_all
Assignment.delete_all
Classroom.delete_all
Rectorat.delete_all
SchoolUser.delete_all
User.delete_all
School.delete_all
Director.delete_all

# DB for schools in 42
school_filepath = File.join(__dir__,'data/schools_42.csv')

sql = <<-SQL
COPY public.schools (name, address, phone, specification, latitude, longitude)
FROM '#{school_filepath}'
DELIMITER ','
CSV HEADER QUOTE '"'
SQL

ActiveRecord::Base.connection.execute(sql)


# autres seeds

School.all.each_with_index do |school, index|
  director = if school.name == "Ecole primaire de la Forêt"
                Director.create!(first_name: "Alfred", last_name: "DUPONT", phone: '0622345647', email: "alfred.dupont@gmai.com")
              elsif school.name == "Ecole primaire Arsenal"
                Director.create!(first_name: "Jeannine", last_name: "MARTEL", phone: '0622348647', email: "alfred.martel@gmai.com")
              elsif school.name == "Ecole maternelle Richelandiere"
                Director.create!(first_name: "Martin", last_name: "DUFOUR", phone: '0722345647', email: "martin.dupont@gmai.com")
              else
                Director.create!(first_name: "first_name_#{index}", last_name: "last_name_#{index}", phone: '06123456789', email: "user#{index}@gmai.com")
              end
  school.update(director: director)
end



# ap School.all
# ap Director.all

school1 = School.find_by(name: 'Ecole primaire de la Forêt')
school2 = School.find_by(name: 'Ecole primaire Arsenal')
school3 = School.find_by(name: 'Ecole maternelle Richelandiere')

user1 = User.create!(first_name: 'first_name1', last_name: 'last_name1', phone: '06123456789', email: 't1@gmail.com', password: "azerty", availability: true, specification: "", level: "CE1")
user2 = User.create!(first_name: 'first_name2', last_name: 'last_name2', phone: '06123456789', email: 't2@gmail.com', password: "azerty", availability: false, specification: "REP+", level: "CP")
user3 = User.create!(first_name: 'first_name3', last_name: 'last_name3', phone: '06123456789', email: 't3@gmail.com', password: "azerty", availability: true, specification: "", level: "CE1")


SchoolUser.create!(user: user1, school: school1, attachment: false)
SchoolUser.create!(user: user1, school: school2, attachment: false)
SchoolUser.create!(user: user1, school: school3, attachment: true)
SchoolUser.create!(user: user2, school: school1, attachment: true)
SchoolUser.create!(user: user2, school: school2, attachment: false)
SchoolUser.create!(user: user2, school: school3, attachment: false)
SchoolUser.create!(user: user3, school: school2, attachment: true)
SchoolUser.create!(user: user3, school: school3, attachment: false)

toto_recto = Rectorat.create!(first_name: "toto", last_name: 'titi', email: 'titi@recto.org')
tata_recto = Rectorat.create!(first_name: "tata", last_name: 'tutu', email: 'tutu@recto.org')

ce1 = Classroom.create!(level: 'CE1', school: school3)
ce2 = Classroom.create!(level: 'CE2', school: school1)

# assignments rectorat
assig1 = Assignment.create!(start_date: 3.days.from_now, end_date: 5.days.from_now, rectorat: toto_recto, classroom: ce1)
assig2 = Assignment.create!(start_date: 6.days.from_now, end_date: 8.days.from_now, rectorat: toto_recto, classroom: ce2)

# assignments du teacher
assig3 = Assignment.create!(start_date: 6.days.from_now, end_date: 8.days.from_now, rectorat: toto_recto, classroom: ce1, user: user1)


review1 = Review.create!(content: "Voici la premiere entrée du carnet de bord de la classe CE1", classroom: ce1, user: user1)
review2 = Review.create!(content: "Voici la premiere entrée du carnet de bord de la classe CE2", classroom: ce2, user: user2)
