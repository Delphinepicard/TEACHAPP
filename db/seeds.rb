# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


SchoolTeacher.destroy_all
Teacher.destroy_all
School.destroy_all
Director.destroy_all


d1 = Director.create!(name: 'toto le directeur', phone: '06123456789', email: 'toto@gmai.com')
d2 = Director.create!(name: 'titi le directeur', phone: '06123456789', email: 'titi@gmai.com')


school1 = School.create!(name: 'school1', director: d1)
school2 = School.create!(name: 'school2', director: d2)
school3 = School.create!(name: 'school3', director: d1)


t1 = Teacher.create!(name: 'name1', mail: 't1@gmail.com', availability: true)
t2 = Teacher.create!(name: 'name2', mail: 't2@gmail.com', availability: true)
t3 = Teacher.create!(name: 'name3', mail: 't3@gmail.com', availability: true)


SchoolTeacher.create!(teacher: t1, school: school1, attachment: false)
SchoolTeacher.create!(teacher: t1, school: school2, attachment: true)
SchoolTeacher.create!(teacher: t1, school: school3, attachment: false)
SchoolTeacher.create!(teacher: t2, school: school1, attachment: true)
SchoolTeacher.create!(teacher: t2, school: school2, attachment: false)
SchoolTeacher.create!(teacher: t2, school: school3, attachment: false)
