# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Assignment.destroy_all
Classroom.destroy_all
Rectorat.destroy_all
SchoolUser.destroy_all
User.destroy_all
School.destroy_all
Director.destroy_all

# DB for schools in 42
school_filepath = File.join(__dir__,'data/schools_42.csv')

sql = <<-SQL
COPY public.schools (name, address, phone, specification, lat, long)
FROM '#{school_filepath}'
DELIMITER ','
CSV HEADER QUOTE '"'
SQL

ActiveRecord::Base.connection.execute(sql)

school1 = School.first
school2 = School.second
school3 = School.third
school285 = School.limit(1).offset(284)


# autres seeds

d1 = Director.create!(first_name: 'toto le directeur', last_name: 'du 42', phone: '06123456789', email: 'toto@gmai.com')
d2 = Director.create!(first_name: 'titi le directeur', last_name: 'du 42 la zone', phone: '06123456789', email: 'titi@gmai.com')

user1 = User.create!(first_name: 'first_name1', last_name: 'last_name1', phone: '06123456789', email: 't1@gmail.com', password: "azerty", availability: true)
user2 = User.create!(first_name: 'first_name2', last_name: 'last_name2', phone: '06123456789', email: 't2@gmail.com', password: "azerty", availability: true)
user3 = User.create!(first_name: 'first_name3', last_name: 'last_name3', phone: '06123456789', email: 't3@gmail.com', password: "azerty", availability: true)


SchoolUser.create!(user: user1, school: school1, attachment: true)
SchoolUser.create!(user: user1, school: school2, attachment: true)
SchoolUser.create!(user: user1, school: school3, attachment: true)
SchoolUser.create!(user: user2, school: school1, attachment: true)
SchoolUser.create!(user: user2, school: school2, attachment: true)
SchoolUser.create!(user: user2, school: school3, attachment: true)

toto_recto = Rectorat.create!(first_name: "toto", last_name: 'titi', email: 'titi@recto.org')
tata_recto = Rectorat.create!(first_name: "tata", last_name: 'tutu', email: 'tutu@recto.org')

ce1 = Classroom.create!(level: 'CE1', school: school1)
ce2 = Classroom.create!(level: 'CE2', school: school1)

assig1 = Assignment.create!(start_date: 3.days.from_now, end_date: 5.days.from_now, rectorat: toto_recto, user: user1, classroom: ce1)
assig2 = Assignment.create!(start_date: 6.days.from_now, end_date: 8.days.from_now, rectorat: toto_recto, user: user2, classroom: ce2)
