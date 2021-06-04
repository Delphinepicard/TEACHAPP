Review.delete_all
Assignment.delete_all
Classroom.delete_all
Rectorat.delete_all
SchoolUser.delete_all
User.delete_all
School.delete_all
Director.delete_all

# DB SCHOOL DU 42 VIA FICHIER CSV

school_filepath = File.join(__dir__,'data/schools_42.csv')

sql = <<-SQL
COPY public.schools (name, address, phone, specification, latitude, longitude)
FROM '#{school_filepath}'
DELIMITER ','
CSV HEADER QUOTE '"'
SQL

ActiveRecord::Base.connection.execute(sql)

school1 = School.find_by(name: 'Ecole maternelle Jaurès')
school2 = School.find_by(name: 'Ecole maternelle Villon')
school3 = School.find_by(name: 'Ecole maternelle Richelandiere')
school4 = School.find_by(name: 'Ecole primaire Jean Macé')
school5 = School.find_by(name: 'Ecole élémentaire François Villon')
school6 = School.find_by(name: 'Ecole primaire Fontquentin')

# DIRECTEURS

School.all.each_with_index do |school, index|
  director = if school.name == "Ecole maternelle Jaurès" #REP
                Director.create!(first_name: "Alfred", last_name: "Dupont", phone: '0622345647', email: "alfred.dupont@gmail.com")
              elsif school.name == "Ecole maternelle Villon" #REP+
                Director.create!(first_name: "Jeannine", last_name: "Martel", phone: '0642647798', email: "alfred.martel@gmail.com")
              elsif school.name == "Ecole maternelle Richelandiere" #
                Director.create!(first_name: "Martin", last_name: "Réveil", phone: '0722345647', email: "martin.reveil@gmail.com")
              elsif school.name == "Ecole primaire Jean Macé" #
                Director.create!(first_name: "Joseph", last_name: "Duvagon", phone: '0744107040', email: "jojo.duvag@gmail.com")
              elsif school.name == "Ecole élémentaire François Villon" #REP+
                Director.create!(first_name: "Alicia", last_name: "Guardiola", phone: '0744107040', email: "alicia.guardiola@gmail.com")
              elsif school.name == "Ecole primaire Fontquentin" #REP
                Director.create!(first_name: "Myriam", last_name: "Biniani", phone: '0744107040', email: "myriam.biniani@gmail.com")
              else
                Director.create!(first_name: "first_name_#{index}", last_name: "last_name_#{index}", phone: '06123456789', email: "user#{index}@gmail.com")
              end
  school.update(director: director)
end

#USERS / TEACHERS

paul     = User.create!(first_name: 'Paul',      last_name: 'Langevin',    phone: '06123456789', email: 'paul.langevin@gmail.com',         password: "azerty", availability: true, specification: "",     level: "CP")

marie    = User.create!(first_name: 'Marie',     last_name: 'Curie',       phone: '0653796357', email: 'marie.curie@gmail.com',           password: "azerty", availability: false, specification: "REP", level: "CE1")

francois = User.create!(first_name: 'François',  last_name: 'Rabelais',    phone: '0609635853', email: 'francois.rabelais@gmail.com',     password: "azerty", availability: true, specification: "",     level: "CE2")

simone   = User.create!(first_name: 'Simone',    last_name: 'de Beauvoir', phone: '0613585946', email: 'simone.debeauvoir@gmail.com',     password: "azerty", availability: true, specification: "REP",  level: "CM1")

yuki     = User.create!(first_name: 'Yukihiro',  last_name: 'Matsumoto',   phone: '0673796376', email: 'yuki.matsu@ruby.com',             password: "azerty", availability: true, specification: "",     level: "CM2")

shigeru  = User.create!(first_name: 'Shigeru',   last_name: 'Miyamoto',    phone: '0622468864', email: 'shigeru.miyamoto@supermario.com', password: "azerty", availability: true, specification: "REP+", level: "PSM")

hubert   = User.create!(first_name: 'Hubert',    last_name: 'Védrine',     phone: '0648634665', email: 'hubert.vedrine@gmail.com',        password: "azerty", availability: true, specification: "",     level: "MSM")

michel   = User.create!(first_name: 'Michel',    last_name: 'Onfray',      phone: '0634545368', email: 'michel.onfray@gmail.com',         password: "azerty", availability: true, specification: "REP",  level: "GSM")

claudie  = User.create!(first_name: 'Claudie',   last_name: 'Haigneré',    phone: '0679573628', email: 'claudie.haignere@gmail.com',      password: "azerty", availability: true, specification: "",     level: "CP")

fabrice  = User.create!(first_name: 'Fabrice',   last_name: 'Luchini',     phone: '0607527597', email: 'fab.luchini@gmail.com',           password: "azerty", availability: true, specification: "REP",  level: "CE1")

blanche  = User.create!(first_name: 'Blanche',   last_name: 'Gardin',      phone: '0615379507', email: 'blanche.gardin@gmail.com',        password: "azerty", availability: true, specification: "",     level: "CE2")

florence = User.create!(first_name: 'Florence',  last_name: 'Foresti',     phone: '0616486975', email: 'flo.foresti@lolmdr.com',          password: "azerty", availability: true, specification: "REP+", level: "CM1")

william  = User.create!(first_name: 'William',   last_name: 'Shakespeare', phone: '0607536378', email: 'will.shake@gmail.com',            password: "azerty", availability: true, specification: "",     level: "CM2")

jean     = User.create!(first_name: 'Jean',      last_name: 'Moulin',      phone: '0676454479', email: 'jean.moulin@gmail.com',           password: "azerty", availability: true, specification: "REP",  level: "PSM")

nelson   = User.create!(first_name: 'Nelson',    last_name: 'Mandela',     phone: '0609753679', email: 'nelson.mandela@gmail.com',        password: "azerty", availability: true, specification: "",     level: "MSM")

pie      = User.create!(first_name: 'Pie',       last_name: 'Tshibanda',   phone: '0613579578', email: 'pietshi@gmail.com',               password: "azerty", availability: true, specification: "REP",  level: "GSM")

alex     = User.create!(first_name: 'Alexandre', last_name: 'Astier',      phone: '0637974536', email: 'alex.astier@gmail.com',           password: "azerty", availability: true, specification: "",     level: "CP")

# RATTACHEMENT PROFS / ETABLISSEMENTS

SchoolUser.create!(user: paul,     school: school1, attachment: true)
SchoolUser.create!(user: marie,    school: school2, attachment: true)
SchoolUser.create!(user: francois, school: school3, attachment: true)
SchoolUser.create!(user: simone,   school: school4, attachment: true)
SchoolUser.create!(user: yuki,     school: school5, attachment: true)
SchoolUser.create!(user: shigeru,  school: school6, attachment: true)
SchoolUser.create!(user: hubert,   school: school1, attachment: true)
SchoolUser.create!(user: michel,   school: school2, attachment: true)
SchoolUser.create!(user: claudie,  school: school3, attachment: true)
SchoolUser.create!(user: fabrice,  school: school4, attachment: true)
SchoolUser.create!(user: blanche,  school: school5, attachment: true)
SchoolUser.create!(user: florence, school: school6, attachment: true)
SchoolUser.create!(user: william,  school: school1, attachment: true)
SchoolUser.create!(user: jean,     school: school2, attachment: true)
SchoolUser.create!(user: nelson,   school: school3, attachment: true)
SchoolUser.create!(user: pie,      school: school3, attachment: true)
SchoolUser.create!(user: alex,     school: school3, attachment: true)

# RECTORAT

toto_recto = Rectorat.create!(first_name: "toto", last_name: 'titi', email: 'titi@recto.org')
tata_recto = Rectorat.create!(first_name: "tata", last_name: 'tutu', email: 'tutu@recto.org')

# CLASSROOM

psm = Classroom.create!(level: 'PSM', school: school1, main_teacher: shigeru)
msm = Classroom.create!(level: 'MSM', school: school2, main_teacher: hubert)
gsm = Classroom.create!(level: 'GSM', school: school3, main_teacher: michel)
cp  = Classroom.create!(level: 'CP',  school: school4, main_teacher: paul)
ce1 = Classroom.create!(level: 'CE1', school: school5, main_teacher: marie)
ce2 = Classroom.create!(level: 'CE2', school: school6, main_teacher: francois)
cm1 = Classroom.create!(level: 'CM1', school: school4, main_teacher: simone)
cm2 = Classroom.create!(level: 'CM2', school: school5, main_teacher: yuki)

# AFFECTATIONS EN ATTENTE DE PROFFESSEUR

assig1 = Assignment.create!(start_date: 1.days.from_now, end_date: 2.days.from_now, rectorat: toto_recto, classroom: psm)
assig2 = Assignment.create!(start_date: 1.days.from_now, end_date: 4.days.from_now, rectorat: toto_recto, classroom: msm)
assig3 = Assignment.create!(start_date: 3.days.from_now, end_date: 6.days.from_now, rectorat: toto_recto, classroom: gsm)
assig4 = Assignment.create!(start_date: 2.days.from_now, end_date: 5.days.from_now, rectorat: toto_recto, classroom: cp)
assig5 = Assignment.create!(start_date: 4.days.from_now, end_date: 8.days.from_now, rectorat: toto_recto, classroom: ce1)
assig6 = Assignment.create!(start_date: 2.days.from_now, end_date: 3.days.from_now, rectorat: toto_recto, classroom: ce2)
assig7 = Assignment.create!(start_date: 2.days.from_now, end_date: 4.days.from_now, rectorat: toto_recto, classroom: cm1)
assig8 = Assignment.create!(start_date: 3.days.from_now, end_date: 9.days.from_now, rectorat: toto_recto, classroom: cm2)

# AFFECTATIONS AVEC PROFFESSEUR

assig9 = Assignment.create!(start_date: 3.days.from_now, end_date: 9.days.from_now, rectorat: toto_recto, classroom: cm2, user: pie)


# REVIEWS

review1 = Review.create!(content: "Bonjour, ils font la sieste à 13h30 et le gouter est à 15h45. Hier, on a essayé de leur faire dire les couleurs.", classroom: psm, user: shigeru)
review2 = Review.create!(content: "Bonjour à toi, j'ai tenté depuis quelques jours de leur apprendre le découpage et le collage. Dans l'ensemble ils sont plutôt assidus.", classroom: msm, user: hubert)
review3 = Review.create!(content: "Hello ! Aujourd'hui c'est atelier puzzle ! Bonne journée :)", classroom: gsm, user: michel)
review4 = Review.create!(content: "Bonjour, ces temps si on apprend à lire et à écrire. Ils s'en sortent très bien. Tu trouveras le livre sur lequel on travaille ces temps ci dans le tiroir du bas. Merci !", classroom: cp, user: paul)
review5 = Review.create!(content: "Bonjour, hier on commencé les soustractions. Ils ont un peu de mal donc j'ai prévu un peu plus d'exercices que tu trouveras sur mon bureau. Ca devrait bien se passer :)", classroom: ce1, user: marie)
review6 = Review.create!(content: "Holà ! Aujourd'hui c'est multiplication !", classroom: ce2, user: francois)
review7 = Review.create!(content: "Cours de géographie depuis mercredi. A finir avec les départements. Merci !", classroom: cm1, user: simone)
review8 = Review.create!(content: "La dictée d'aujourd'hui est très importante ! Attention ils ont tendance à tricher. A surveiller comme le lait sur le feu !", classroom: cm2, user: yuki)
