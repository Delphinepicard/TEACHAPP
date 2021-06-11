require "open-uri"

Review.delete_all
Assignment.delete_all
Classroom.delete_all
Rectorat.delete_all
SchoolUser.delete_all
User.delete_all
School.delete_all
Director.delete_all

# DB SCHOOL DU 42

jaures        = School.create!(name: 'Ecole maternelle Jaurès', address: '4 rue du Colonel Marey 42500 LE CHAMBON FEUGEROLLES', phone: '0477610270', specification: 'REP', latitude: '45.395209426831215', longitude: '4.322800191508945', director: Director.create!(first_name: "Alfred", last_name: "Dupont", phone: '0622345647', email: "alfred.dupont@gmail.com")) #REP
villon        = School.create!(name: 'Ecole maternelle Villon', address: 'Boulevard de Fonsala 42400 ST CHAMOND', phone: '0477226887', specification: 'REP+', latitude: '45.47628992883215', longitude: '4.529400470097042', director: Director.create!(first_name: "Jeannine", last_name: "Martel", phone: '0642647798', email: "alfred.martel@gmail.com")) #REP+
richelandiere = School.create!(name: 'Ecole maternelle Richelandière', address: '97 rue Richelandière 42100 ST ETIENNE', phone: '0477331334', specification: '', latitude: '45.43639035550118', longitude: '4.4122394137415775', director: Director.create!(first_name: "Martin", last_name: "Réveil", phone: '0722345647', email: "martin.reveil@gmail.com")) #
jean_mace     = School.create!(name: 'Ecole primaire Jean Macé', address: '59 route de l\'Etrat 42270 ST PRIEST EN JAREZ', phone: '0477790516', specification: '', latitude: '45.4783642933794', longitude: '4.382120283150085', director: Director.create!(first_name: "Joseph", last_name: "Duvagon", phone: '0744107040', email: "jojo.duvag@gmail.com")) #
montrambert   = School.create!(name: 'Ecole élémentaire Montrambert', address: '6 impasse Guy Môquet 42150 LA RICAMARIE', phone: '0477570075', specification: 'REP+', latitude: '45.40106893619104', longitude: '4.36127945037419', director: Director.create!(first_name: "Alicia", last_name: "Guardiola", phone: '0744107040', email: "alicia.guardiola@gmail.com")) #REP+
victor_hugo   = School.create!(name: 'Ecole élémentaire Victor Hugo', address: '7 rue Raoul Follereau 42500 LE CHAMBON FEUGEROLLES', phone: '0477561856', specification: 'REP', latitude: '45.38530786842765', longitude: '4.306579418827878', director: Director.create!(first_name: "Myriam", last_name: "Biniani", phone: '0744107040', email: "myriam.biniani@gmail.com")) #REP

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

fabrice  = User.create!(first_name: 'Fabrice',   last_name: 'Luchini',     phone: '0607527597', email: 'fab.luchini42@gmail.com',           password: "azerty", availability: true, specification: "REP+",     level: "CE1")
fabrice_file = URI.open('https://cdn.radiofrance.fr/s3/cruiser-production/2017/05/52d4439b-7ead-4960-86dd-ce488472f99c/838_luchini1200.jpg')
fabrice.photo.attach(io: fabrice_file, filename: 'fabrice.jpg', content_type: 'image/jpg')

blanche  = User.create!(first_name: 'Blanche',   last_name: 'Gardin',      phone: '0615379507', email: 'blanche.gardin42@gmail.com',        password: "azerty", availability: true, specification: "REP",  level: "CE2")
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

thomas   = User.create!(first_name: 'Thomas',    last_name: 'Piketty',     phone: '0633561008', email: 'thom.piketty@gmail.com',          password: "azerty", availability: true, specification: "", level: "CE1")
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

delphine = User.create!(first_name: 'Delphine',    last_name: 'Picard', phone: '0644770321',  email: 'delphinepcd.lewagon@gmail.com', password: "azerty", availability: true, specification: "REP+", level: "CE1")
delphine_file = File.open("#{Rails.root}/app/assets/images/photo_delphine.jpg")
delphine.photo.attach(io: delphine_file, filename: 'photo_delphine.jpg', content_type: 'image/jpg')

# RATTACHEMENT PROFS / ETABLISSEMENTS

SchoolUser.create!(user: paul,     school: jaures,        attachment: true)
SchoolUser.create!(user: marie,    school: villon,        attachment: true)
SchoolUser.create!(user: francois, school: richelandiere, attachment: true)
SchoolUser.create!(user: simone,   school: jean_mace,     attachment: true)
SchoolUser.create!(user: yuki,     school: montrambert,   attachment: true)
SchoolUser.create!(user: shigeru,  school: victor_hugo,   attachment: true)
SchoolUser.create!(user: hubert,   school: jaures,        attachment: true)
SchoolUser.create!(user: michel,   school: villon,        attachment: true)
SchoolUser.create!(user: claudie,  school: richelandiere, attachment: true)
SchoolUser.create!(user: fabrice,  school: villon,        attachment: true)
SchoolUser.create!(user: blanche,  school: montrambert,   attachment: true)
SchoolUser.create!(user: florence, school: jean_mace,     attachment: true)
SchoolUser.create!(user: william,  school: jaures,        attachment: true)
SchoolUser.create!(user: jean,     school: villon,        attachment: true)
SchoolUser.create!(user: nelson,   school: richelandiere, attachment: true)
SchoolUser.create!(user: pie,      school: jean_mace,     attachment: true)
SchoolUser.create!(user: alex,     school: montrambert,   attachment: true)
SchoolUser.create!(user: thomas,   school: victor_hugo,   attachment: true)
SchoolUser.create!(user: bernard,  school: jaures,        attachment: true)
SchoolUser.create!(user: gaspard,  school: villon,        attachment: true)
SchoolUser.create!(user: hayao,    school: richelandiere, attachment: true)
SchoolUser.create!(user: idriss,   school: jean_mace,     attachment: true)
SchoolUser.create!(user: marina,   school: montrambert,   attachment: true)
SchoolUser.create!(user: kyan,     school: victor_hugo,   attachment: true)
SchoolUser.create!(user: delphine, school: victor_hugo,   attachment: true)

# # RECTORAT

toto_recto = Rectorat.create!(first_name: "toto", last_name: 'titi', email: 'titi@recto.org')
tata_recto = Rectorat.create!(first_name: "tata", last_name: 'tutu', email: 'tutu@recto.org')

# # CLASSROOM

psm = Classroom.create!(level: 'PSM', school: jaures,        main_teacher: shigeru)
msm = Classroom.create!(level: 'MSM', school: villon,        main_teacher: michel)
gsm = Classroom.create!(level: 'GSM', school: richelandiere, main_teacher: hubert)
cp  = Classroom.create!(level: 'CP',  school: jean_mace,     main_teacher: paul)
ce1 = Classroom.create!(level: 'CE1', school: montrambert,   main_teacher: marie)
ce2 = Classroom.create!(level: 'CE2', school: victor_hugo,   main_teacher: francois)
cm1 = Classroom.create!(level: 'CM1', school: jean_mace,     main_teacher: simone)
cm2 = Classroom.create!(level: 'CM2', school: montrambert,   main_teacher: yuki)

# # CLASSROOM FOR ASSIGNMENT WITH USER

cm2_w_user = Classroom.create!(level: 'CM2', school: montrambert,   main_teacher: yuki)
ce2_w_user = Classroom.create!(level: 'CE2', school: victor_hugo,   main_teacher: francois)
gsm_w_user = Classroom.create!(level: 'GSM', school: richelandiere, main_teacher: michel)

# # AFFECTATIONS EN ATTENTE DE PROFFESSEUR

assig1 = Assignment.create!(start_date: 2.days.from_now, end_date: 7.days.from_now, rectorat: toto_recto, classroom: psm)
assig2 = Assignment.create!(start_date: 2.days.from_now, end_date: 4.days.from_now, rectorat: toto_recto, classroom: msm)
assig3 = Assignment.create!(start_date: 3.days.from_now, end_date: 6.days.from_now, rectorat: toto_recto, classroom: gsm)
assig4 = Assignment.create!(start_date: 3.days.from_now, end_date: 5.days.from_now, rectorat: toto_recto, classroom: cp)
assig5 = Assignment.create!(start_date: 6.days.from_now, end_date: 9.days.from_now, rectorat: toto_recto, classroom: ce2)
assig6 = Assignment.create!(start_date: 2.days.from_now, end_date: 4.days.from_now, rectorat: toto_recto, classroom: cm1)
assig7 = Assignment.create!(start_date: 4.days.from_now, end_date: 9.days.from_now, rectorat: toto_recto, classroom: cm2)

#AFFECTATION EN ATTENTE DE PROF - POUR DELPHINE

assig8 = Assignment.create!(start_date: 1.days.from_now, end_date: 6.days.from_now, rectorat: toto_recto, classroom: ce1)

assig8 = Assignment.create!(start_date: 15.days.from_now, end_date: 18.days.from_now, rectorat: toto_recto, classroom: ce1)


# # AFFECTATIONS AVEC PROFESSEUR

assig9  = Assignment.create!(start_date: 3.days.ago, end_date: 2.days.from_now, rectorat: toto_recto, classroom: cm2_w_user, user: hayao)
assig10 = Assignment.create!(start_date: 1.days.ago, end_date: 1.days.from_now, rectorat: toto_recto, classroom: ce2_w_user, user: blanche)
assig11 = Assignment.create!(start_date: 5.days.ago, end_date: 1.days.from_now, rectorat: toto_recto, classroom: gsm_w_user, user: pie)


# AFFECTATIONS DE DELPHINE PASSEE ET FUTUR

assig23 = Assignment.create!(start_date: 11.days.from_now, end_date: 13.days.from_now, rectorat: toto_recto, classroom: gsm, user: delphine)
assig24 = Assignment.create!(start_date: 18.days.ago, end_date: 8.days.ago, rectorat: toto_recto, classroom: cp, user: delphine)
assig25 = Assignment.create!(start_date: 28.days.ago, end_date: 20.days.ago, rectorat: toto_recto, classroom: ce1, user: delphine)
assig26 = Assignment.create!(start_date: 34.days.ago, end_date: 32.days.ago, rectorat: toto_recto, classroom: ce2, user: delphine)
assig27 = Assignment.create!(start_date: 37.days.ago, end_date: 35.days.ago, rectorat: toto_recto, classroom: cm1, user: delphine)

# # REVIEWS

review1 = Review.create!(content: "Bonjour, ils font la sieste à 13h30 et le goûter est à 15h45. Hier, nous avons étudié les couleurs.",                   classroom: psm, user: shigeru)

review2 = Review.create!(content: "Bonjour à toi, j'ai tenté depuis quelques jours de leur apprendre le découpage et le collage. Dans l'ensemble, ils sont plutôt assidus.", classroom: msm, user: michel)

review3 = Review.create!(content: "Hello ! Aujourd'hui, c'est atelier puzzle ! Bonne journée :)",                                                       classroom: gsm, user: hubert)

review4 = Review.create!(content: "Bonjour, nous avons effectué un exercice de lecture et d'écriture. Ils s'en sortent très bien. Tu trouveras le livre sur lequel on a travaillé dans le tiroir du bas. Merci ! !",                                                       classroom: cp,  user: paul)

review5 = Review.create!(content: "Bonjour, hier, nous avons commencé les premiers exercices concernant les soustractions. Ils ont eu quelques difficultés, j'ai sélectionné des exercices plus abordables : ils sont dans le tiroir du bureau. Cela devrait les aider à progresser :)",                                                       classroom: cm1, user: marie)

review6 = Review.create!(content: "Holà ! Aujourd'hui c'est multiplication !",                                                       classroom: ce2, user: francois)

review7 = Review.create!(content: "La dictée d'aujourd'hui est très importante ! Attention ils ont tendance à tricher. A surveiller comme le lait sur le feu !", classroom: cm2, user: yuki)

# # REVIEWS pr DELPHINE

review8 = Review.create!(content: "Matin : orthographe (dictée n°28) et atelier multiplication 1er niveau. Après-midi : Cours de géographie. A finir : le thème sur les départements.",                                                       classroom: ce1, user: marie)

review9 = Review.create!(content: "Matin : poésie (n°33) et atelier multiplication à virgules 2ème niveau. Plus de difficultés sur les mathématiques => prévoir révision. Après-midi : atelier lecture et lancement du projet peinture (Monnet).",                                                       classroom: ce1, user: marie)

review10 = Review.create!(content: "Matin : grammaire (COD et COI) et rappel sur les multiplications à virgules. Après-midi : reprise de l'atelier potager et sensibilisation à l'environnement.",                                                        classroom: ce1, user: marie)

review11 = Review.create!(content: "Matin : orthographe (dictée n°35) et atelier mathématiques : découverte des divisions. Après-midi : poursuite du projet peinture (Monnet).",                                                                                        classroom: ce1, user: marie)

review12 = Review.create!(content: "Matin : grammaire (ORNICAR) et atelier mathématiques : division niveau 2. Après-midi : initiation danse et musique en partenariat avec le conservatoire de Saint Chamond.",                                                       classroom: ce1, user: marie)

review13 = Review.create!(content: "Matin : QUIZZ lecture (Petit Prince) et atelier géométrie. Après-midi : séance piscine. En vue de mon absence, prévoir de poursuivre en maths les ateliers divison (niveau 2), en orthographe la dictée n°56 et lancer le nouveau projet lecture (Charlie et la chocolaterie).",                                                       classroom: ce1, user: marie)




