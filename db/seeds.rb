require "open-uri"

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
paul_file = URI.open('https://upload.wikimedia.org/wikipedia/commons/9/9c/Paul_Langevin_Wellcome2.jpg')
paul.photo.attach(io: paul_file, filename: 'paul.jpg', content_type: 'image/jpg')

marie    = User.create!(first_name: 'Marie',     last_name: 'Curie',       phone: '0653796357', email: 'marie.curie@gmail.com',           password: "azerty", availability: true, specification: "REP", level: "CE1")
marie_file = URI.open('https://www.sciencesetavenir.fr/assets/img/2017/11/07/cover-r4x3w1000-5a01cdfa18d26-marie-curie-tekniska-museet.jpg')
marie.photo.attach(io: marie_file, filename: 'marie.jpg', content_type: 'image/jpg')

francois = User.create!(first_name: 'François',  last_name: 'Rabelais',    phone: '0609635853', email: 'francois.rabelais@gmail.com',     password: "azerty", availability: true, specification: "REP+", level: "CE2")
francois_file = URI.open('https://upload.wikimedia.org/wikipedia/commons/8/8d/Francois_Rabelais_-_Portrait.jpg')
francois.photo.attach(io: francois_file, filename: 'francois.jpg', content_type: 'image/jpg')

simone   = User.create!(first_name: 'Simone',    last_name: 'de Beauvoir', phone: '0613585946', email: 'simone.debeauvoir@gmail.com',     password: "azerty", availability: true, specification: "",     level: "CM1")
simone_file = URI.open('https://resize-elle.ladmedia.fr/r/625,,forcex/crop/625,804,center-middle,forcex,ffffff/img/var/plain_site/storage/images/personnalites/simone-de-beauvoir/86782643-1-fre-FR/Simone-de-Beauvoir.jpg')
simone.photo.attach(io: simone_file, filename: 'simone.jpg', content_type: 'image/jpg')

yuki     = User.create!(first_name: 'Yukihiro',  last_name: 'Matsumoto',   phone: '0673796376', email: 'yuki.matsu@ruby.com',             password: "azerty", availability: true, specification: "REP",  level: "CM2")
yuki_file = URI.open('https://res.cloudinary.com/crunchbase-production/image/upload/c_thumb,h_256,w_256,f_auto,g_faces,z_0.7,q_auto:eco/v1405557482/t7mlkhrbjnrzmpiolab6.jpg')
yuki.photo.attach(io: yuki_file, filename: 'yuki.jpg', content_type: 'image/jpg')

shigeru  = User.create!(first_name: 'Shigeru',   last_name: 'Miyamoto',    phone: '0622468864', email: 'shigeru.miyamoto@supermario.com', password: "azerty", availability: true, specification: "REP+", level: "PSM")
shigeru_file = URI.open('https://global-img.gamergen.com/shigeru-miyamoto_09026C019D00808106.jpg')
shigeru.photo.attach(io: shigeru_file, filename: 'shigeru.jpg', content_type: 'image/jpg')

hubert   = User.create!(first_name: 'Hubert',    last_name: 'Védrine',     phone: '0648634665', email: 'hubert.vedrine@gmail.com',        password: "azerty", availability: true, specification: "",     level: "GSM")
hubert_file = URI.open('https://cdn.radiofrance.fr/s3/cruiser-production/2020/04/44b81079-4f8f-4042-9199-6427f2fa9316/260x348_hubert_vedrine-photo_by_eric_fougere-vip_images-corbis_via_getty_images.jpg')
hubert.photo.attach(io: hubert_file, filename: 'hubert.jpg', content_type: 'image/jpg')

michel   = User.create!(first_name: 'Michel',    last_name: 'Onfray',      phone: '0634545368', email: 'michel.onfray@gmail.com',         password: "azerty", availability: true, specification: "REP+",  level: "MSM")
michel_file = URI.open('https://cdn.radiofrance.fr/s3/cruiser-production/2020/05/ef744377-e377-460c-aacc-394d0c74d603/838_000_19w4dc.jpg')
michel.photo.attach(io: michel_file, filename: 'michel.jpg', content_type: 'image/jpg')

claudie  = User.create!(first_name: 'Claudie',   last_name: 'Haigneré',    phone: '0679573628', email: 'claudie.haignere@gmail.com',      password: "azerty", availability: true, specification: "REP+", level: "CP")
claudie_file = URI.open('https://cdn.radiofrance.fr/s3/cruiser-production/2015/05/e0b35b46-0609-11e5-bab6-005056a87c30/640_vh002074.jpg')
claudie.photo.attach(io: claudie_file, filename: 'claudie.jpg', content_type: 'image/jpg')

fabrice  = User.create!(first_name: 'Fabrice',   last_name: 'Luchini',     phone: '0607527597', email: 'fab.luchini@gmail.com',           password: "azerty", availability: true, specification: "",     level: "CE1")
fabrice_file = URI.open('https://cdn.radiofrance.fr/s3/cruiser-production/2017/05/52d4439b-7ead-4960-86dd-ce488472f99c/838_luchini1200.jpg')
fabrice.photo.attach(io: fabrice_file, filename: 'fabrice.jpg', content_type: 'image/jpg')

blanche  = User.create!(first_name: 'Blanche',   last_name: 'Gardin',      phone: '0615379507', email: 'blanche.gardin@gmail.com',        password: "azerty", availability: true, specification: "REP",  level: "CE2")
blanche_file = URI.open('https://static1.purepeople.com/articles/5/41/07/95/@/5909702-blanche-gardin-photocall-film-effacer-amp_article_image_big-2.jpg')
blanche.photo.attach(io: blanche_file, filename: 'blanche.jpg', content_type: 'image/jpg')

florence = User.create!(first_name: 'Florence',  last_name: 'Foresti',     phone: '0616486975', email: 'flo.foresti@lolmdr.com',          password: "azerty", availability: true, specification: "REP+", level: "CM1")
florence_file = URI.open('https://cdn-s-www.leprogres.fr/images/6E232050-9A3B-48AD-A730-B32552A7A79B/NW_raw/pendant-une-heure-et-demie-l-humoriste-lyonnaise-enchaine-les-saillies-photo-d-archives-progres-philippe-vacher-1568797488.jpg')
florence.photo.attach(io: florence_file, filename: 'florence.jpg', content_type: 'image/jpg')

william  = User.create!(first_name: 'William',   last_name: 'Shakespeare', phone: '0607536378', email: 'will.shake@gmail.com',            password: "azerty", availability: true, specification: "",     level: "CM2")
william_file = URI.open('https://upload.wikimedia.org/wikipedia/commons/a/a2/Shakespeare.jpg')
william.photo.attach(io: william_file, filename: 'william.jpg', content_type: 'image/jpg')

jean     = User.create!(first_name: 'Jean',      last_name: 'Moulin',      phone: '0676454479', email: 'jean.moulin@gmail.com',           password: "azerty", availability: true, specification: "REP",  level: "PSM")
jean_file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Moulin_Harcourt_1937.jpg/260px-Moulin_Harcourt_1937.jpg')
jean.photo.attach(io: jean_file, filename: 'jean.jpg', content_type: 'image/jpg')

nelson   = User.create!(first_name: 'Nelson',    last_name: 'Mandela',     phone: '0609753679', email: 'nelson.mandela@gmail.com',        password: "azerty", availability: true, specification: "REP+", level: "MSM")
nelson_file = URI.open('https://karsh.org/wordpress/wp-content/uploads/2017/06/Yousuf-Karsh-Nelson-Mandela-1990-1523x1960.jpg')
nelson.photo.attach(io: nelson_file, filename: 'nelson.jpg', content_type: 'image/jpg')

pie      = User.create!(first_name: 'Pie',       last_name: 'Tshibanda',   phone: '0613579578', email: 'pietshi@gmail.com',               password: "azerty", availability: true, specification: "",     level: "GSM")
pie_file = URI.open('https://rcf.fr/sites/default/static.rcf.fr/radios/rcfsudbe/visuels/pie_tshibanda.jpg')
pie.photo.attach(io: pie_file, filename: 'pie.jpg', content_type: 'image/jpg')

alex     = User.create!(first_name: 'Alexandre', last_name: 'Astier',      phone: '0637974536', email: 'alex.astier@gmail.com',           password: "azerty", availability: true, specification: "REP",  level: "CP")
alex_file = URI.open('https://imgsrc.cineserie.com/2020/08/alexandre-astier-je-me-dis-que-kaamelott-etait-fait-pour-le-cinema.jpg')
alex.photo.attach(io: alex_file, filename: 'alex.jpg', content_type: 'image/jpg')

thomas   = User.create!(first_name: 'Thomas',    last_name: 'Piketty',     phone: '0633561008', email: 'thom.piketty@gmail.com',          password: "azerty", availability: true, specification: "REP+", level: "CE1")
thomas_file = URI.open('https://cap.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Fcap.2F2020.2F06.2F24.2F3befb28f-5c2e-4726-987f-2d2bcd1cbe3c.2Ejpeg/790x395/background-color/ffffff/quality/90/le-capital-au-xxie-siecle-le-juteux-cachet-du-scenariste-thomas-piketty-1373614.jpg')
thomas.photo.attach(io: thomas_file, filename: 'thomas.jpg', content_type: 'image/jpg')

bernard  = User.create!(first_name: 'Bernard',   last_name: 'Werber',      phone: '0753379118', email: 'beberwerber@gmail.com',           password: "azerty", availability: true, specification: "",     level: "CE2")
bernard_file = URI.open('https://ec56229aec51f1baff1d-185c3068e22352c56024573e929788ff.ssl.cf1.rackcdn.com/attachments/large/6/1/5/005752615.jpg')
bernard.photo.attach(io: bernard_file, filename: 'bernard.jpg', content_type: 'image/jpg')

gaspard  = User.create!(first_name: 'Gaspard',   last_name: 'Proust',      phone: '0611357689', email: 'gaspard.proust@gmail.com',        password: "azerty", availability: true, specification: "REP",  level: "CM1")
gaspard_file = URI.open('https://www.fnacspectacles.com/static/0/visuel/600/290/GASPARD-PROUST_2901155137904954221.jpg')
gaspard.photo.attach(io: gaspard_file, filename: 'gaspard.jpg', content_type: 'image/jpg')

hayao    = User.create!(first_name: 'Hayao',     last_name: 'Miyazaki',    phone: '0712274490', email: 'hayaomimi@gmail.com',             password: "azerty", availability: true, specification: "REP+", level: "CM2")
hayao_file = URI.open('https://mobile-img.lpcdn.ca/lpca/924x/r3996/793911a2-5f36-11eb-a88b-02fe89184577.jpg')
hayao.photo.attach(io: hayao_file, filename: 'hayao.jpg', content_type: 'image/jpg')

idriss   = User.create!(first_name: 'Idriss',    last_name: 'Aberkane',    phone: '0633567005', email: 'idrissaberkane@gmail.com',        password: "azerty", availability: true, specification: "",     level: "PSM")
idriss_file = URI.open('https://pbs.twimg.com/profile_images/1038355396937830405/GNIdAGmo.jpg')
idriss.photo.attach(io: idriss_file, filename: 'idriss.jpg', content_type: 'image/jpg')

marina   = User.create!(first_name: 'Marina',    last_name: 'Foïs',        phone: '0722452859', email: 'marina.fois@gmail.com',           password: "azerty", availability: true, specification: "REP",  level: "MSM")
marina_file = URI.open('https://static1.purepeople.com/articles/6/35/38/16/@/5070848-marina-fois-montee-des-marches-du-film-624x600-1.jpg')
marina.photo.attach(io: marina_file, filename: 'marina.jpg', content_type: 'image/jpg')

kyan     = User.create!(first_name: 'Kyan',      last_name: 'Khojandi',    phone: '0644770221', email: 'kyankho@gmail.com',               password: "azerty", availability: true, specification: "REP+", level: "GSM")
kyan_file = URI.open('https://www.fnacspectacles.com/static/0/visuel/300/317/KYAN-KHOJANDI-_3171432722583648527.jpg')
kyan.photo.attach(io: kyan_file, filename: 'kyan.jpg', content_type: 'image/jpg')

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
SchoolUser.create!(user: pie,      school: school4, attachment: true)
SchoolUser.create!(user: alex,     school: school5, attachment: true)
SchoolUser.create!(user: thomas,   school: school6, attachment: true)
SchoolUser.create!(user: bernard,  school: school1, attachment: true)
SchoolUser.create!(user: gaspard,  school: school2, attachment: true)
SchoolUser.create!(user: hayao,    school: school3, attachment: true)
SchoolUser.create!(user: idriss,   school: school4, attachment: true)
SchoolUser.create!(user: marina,   school: school5, attachment: true)
SchoolUser.create!(user: kyan,     school: school6, attachment: true)

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

# CLASSROOM FOR ASSIGNMENT WITH USER

cm2_w_user = Classroom.create!(level: 'CM2', school: school5, main_teacher: yuki)
ce2_w_user  = Classroom.create!(level: 'CE2',  school: school6, main_teacher: francois)
gsm_w_user = Classroom.create!(level: 'GSM', school: school3, main_teacher: michel)

# AFFECTATIONS EN ATTENTE DE PROFFESSEUR

assig1 = Assignment.create!(start_date: 1.days.from_now, end_date: 2.days.from_now, rectorat: toto_recto, classroom: psm, user: paul)
assig2 = Assignment.create!(start_date: 1.days.from_now, end_date: 4.days.from_now, rectorat: toto_recto, classroom: msm)
assig3 = Assignment.create!(start_date: 3.days.from_now, end_date: 6.days.from_now, rectorat: toto_recto, classroom: gsm)
assig4 = Assignment.create!(start_date: 2.days.from_now, end_date: 5.days.from_now, rectorat: toto_recto, classroom: cp)
assig5 = Assignment.create!(start_date: 4.days.from_now, end_date: 8.days.from_now, rectorat: toto_recto, classroom: ce1)
assig6 = Assignment.create!(start_date: 2.days.from_now, end_date: 3.days.from_now, rectorat: toto_recto, classroom: ce2)
assig7 = Assignment.create!(start_date: 2.days.from_now, end_date: 4.days.from_now, rectorat: toto_recto, classroom: cm1)
assig8 = Assignment.create!(start_date: 4.days.from_now, end_date: 9.days.from_now, rectorat: toto_recto, classroom: cm2)

# AFFECTATIONS AVEC PROFFESSEUR

assig9  = Assignment.create!(start_date: 3.days.ago, end_date: 2.days.from_now, rectorat: toto_recto, classroom: cm2_w_user, user: hayao)

assig10 = Assignment.create!(start_date: 1.days.ago, end_date: 1.days.from_now, rectorat: toto_recto, classroom: ce2_w_user, user: blanche)

assig11 = Assignment.create!(start_date: 5.days.ago, end_date: 1.days.from_now, rectorat: toto_recto, classroom: gsm_w_user, user: pie)

# REVIEWS

review1 = Review.create!(content: "Bonjour, ils font la sieste à 13h30 et le gouter est à 15h45. Hier, on a essayé de leur faire dire les couleurs.", classroom: psm, user: shigeru)
review2 = Review.create!(content: "Bonjour à toi, j'ai tenté depuis quelques jours de leur apprendre le découpage et le collage. Dans l'ensemble ils sont plutôt assidus.", classroom: msm, user: hubert)
review3 = Review.create!(content: "Hello ! Aujourd'hui c'est atelier puzzle ! Bonne journée :)", classroom: gsm, user: michel)
review4 = Review.create!(content: "Bonjour, ces temps si on apprend à lire et à écrire. Ils s'en sortent très bien. Tu trouveras le livre sur lequel on travaille ces temps ci dans le tiroir du bas. Merci !", classroom: cp, user: paul)
review5 = Review.create!(content: "Bonjour, hier on commencé les soustractions. Ils ont un peu de mal donc j'ai prévu un peu plus d'exercices que tu trouveras sur mon bureau. Ca devrait bien se passer :)", classroom: ce1, user: marie)
review6 = Review.create!(content: "Holà ! Aujourd'hui c'est multiplication !", classroom: ce2, user: francois)
review7 = Review.create!(content: "Cours de géographie depuis mercredi. A finir avec les départements. Merci !", classroom: cm1, user: simone)
review8 = Review.create!(content: "La dictée d'aujourd'hui est très importante ! Attention ils ont tendance à tricher. A surveiller comme le lait sur le feu !", classroom: cm2, user: yuki)
