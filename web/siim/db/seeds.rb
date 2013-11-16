# encoding: utf-8

# -----------------------------------------------------------------------------
#
#
#
# -----------------------------------------------------------------------------
# Delete Indexes....
# -----------------------------------------------------------------------------
# Comment if not has installed and running elasticsearch server...
MedicalHistorySearchEngine.delete_indexes
# -----------------------------------------------------------------------------
#
#
#
# -----------------------------------------------------------------------------
# Roles....
# -----------------------------------------------------------------------------
# Functional...
medical_role = Role.create name: 'medical'
appointment_manager_role = Role.create name: 'appointment_manager'
#
# Administration...
search_engine_admin_role = Role.create name: 'search_engine_admin'
user_admin_role = Role.create name: 'user_admin'
system_admin_role = Role.create name: 'system_admin'
# -----------------------------------------------------------------------------
#
#
#
# -----------------------------------------------------------------------------
# users....
# -----------------------------------------------------------------------------
admin_user = User.create(
	dni: "29042902",first_name: "Adrian", last_name: "Marino",
	email: "adrianmarino@gmail.com", password: "29042902",
	roles: [
			medical_role,
			appointment_manager_role,
			search_engine_admin_role,
			user_admin_role,
			system_admin_role
		]
	)

medical = User.create(
	dni: "11111111",first_name: "Manuel", last_name: "Rodriguez",
	email: "manuelrodriguez@gmail.com", password: "11111111",
	roles: [medical_role])

appointment_manager = User.create(
	dni: "77777777",first_name: "Demo 1", last_name: "Demo 1",
	email: "marquez.ezequiel19@gmail.com", password: "usrDemo1",
	roles: [appointment_manager_role])

search_engine_admin = User.create(
	dni: "22222222",first_name: "Daniel", last_name: "Pereira",
	email: "daniel.pereira@gmail.com", password: "22222222",
	roles: [search_engine_admin_role]
)

medical_history_admin = User.create(
		dni: "33333333",first_name: "Carlos", last_name: "Trenza",
		email: "carlos.trenza@gmail.com", password: "33333333",
		roles: [user_admin_role]
)

user_admin = User.create(
	dni: "44444444",first_name: "Juan Carlos", last_name: "Pena",
	email: "juan.carlos.mesa@gmail.com", password: "44444444",
		roles: [system_admin_role]
)
# -----------------------------------------------------------------------------
#
#
#
# -----------------------------------------------------------------------------
# Medical specializations....
# -----------------------------------------------------------------------------
pediatra = MedicalSpecialization.create(name: "Pediatria")
traumatologo = MedicalSpecialization.create(name: "Traumatologia")
oftalmologo = MedicalSpecialization.create(name: "Oftalmologia")
clinic = MedicalSpecialization.create(name: "Clinico")
# -----------------------------------------------------------------------------
#
#
#
# -----------------------------------------------------------------------------
# Attention Periods...
# -----------------------------------------------------------------------------
period_monday_1 = AttentionPeriod.create(
	begin_hour: 9, 
	begin_minutes: 0,
	end_hour: 13,
	end_minutes: 0,
	week_day: 1
)
period_monday_2 = AttentionPeriod.create(
	begin_hour: 14, 
	begin_minutes: 0,
	end_hour: 18,
	end_minutes: 0,
	week_day: 1
)
period_monday_3 = AttentionPeriod.create(
	begin_hour: 9, 
	begin_minutes: 0,
	end_hour: 13,
	end_minutes: 0,
	week_day: 1
)
period_monday_4 = AttentionPeriod.create(
	begin_hour: 14, 
	begin_minutes: 0,
	end_hour: 18,
	end_minutes: 0,
	week_day: 1
)
period_monday_5 = AttentionPeriod.create(
	begin_hour: 9, 
	begin_minutes: 0,
	end_hour: 13,
	end_minutes: 0,
	week_day: 1
)
period_monday_6 = AttentionPeriod.create(
	begin_hour: 14, 
	begin_minutes: 0,
	end_hour: 18,
	end_minutes: 0,
	week_day: 1
)

period_monday_7 = AttentionPeriod.create(
		begin_hour: 9,
		begin_minutes: 0,
		end_hour: 13,
		end_minutes: 0,
		week_day: 1
)
period_tuesday_7 = AttentionPeriod.create(
		begin_hour: 9,
		begin_minutes: 0,
		end_hour: 13,
		end_minutes: 0,
		week_day: 2
)
period_wednesday_7 = AttentionPeriod.create(
		begin_hour: 9,
		begin_minutes: 0,
		end_hour: 13,
		end_minutes: 0,
		week_day: 3
)
period_thursday_7 = AttentionPeriod.create(
		begin_hour: 9,
		begin_minutes: 0,
		end_hour: 13,
		end_minutes: 0,
		week_day: 4
)
period_friday_7 = AttentionPeriod.create(
	begin_hour: 14, 
	begin_minutes: 0,
	end_hour: 20,
	end_minutes: 0,
	week_day: 5
)
period_saturday_7 = AttentionPeriod.create(
	begin_hour: 14, 
	begin_minutes: 0,
	end_hour: 20,
	end_minutes: 0,
	week_day: 6
)
period_sunday_7 = AttentionPeriod.create(
	begin_hour: 14, 
	begin_minutes: 0,
	end_hour: 20,
	end_minutes: 0,
	week_day: 7
)
period_monday_8 = AttentionPeriod.create(
	begin_hour: 9, 
	begin_minutes: 0,
	end_hour: 13,
	end_minutes: 0,
	week_day: 1
)
period_monday_9 = AttentionPeriod.create(
	begin_hour: 14, 
	begin_minutes: 0,
	end_hour: 18,
	end_minutes: 0,
	week_day: 1
)
period_monday_10 = AttentionPeriod.create(
	begin_hour: 9, 
	begin_minutes: 0,
	end_hour: 13,
	end_minutes: 0,
	week_day: 1
)
period_monday_11 = AttentionPeriod.create(
	begin_hour: 14, 
	begin_minutes: 0,
	end_hour: 18,
	end_minutes: 0,
	week_day: 1
)
period_monday_12 = AttentionPeriod.create(
	begin_hour: 9, 
	begin_minutes: 0,
	end_hour: 13,
	end_minutes: 0,
	week_day: 1
)
period_monday_13 = AttentionPeriod.create(
	begin_hour: 14, 
	begin_minutes: 0,
	end_hour: 18,
	end_minutes: 0,
	week_day: 1
)
period_friday_14 = AttentionPeriod.create(
	begin_hour: 14, 
	begin_minutes: 0,
	end_hour: 20,
	end_minutes: 0,
	week_day: 5
)
# -----------------------------------------------------------------------------
#
#
#
# -----------------------------------------------------------------------------
# Medicals...
# -----------------------------------------------------------------------------
medical_a = Medical.create(
	dni: "10042902",									cuil: "20-10042902-2",
	firstname: "Juan Pedro", 					lastname: "Pepe",
	home_phone: "47935551", 					movile_phone: "154487766",
	medical_specialization: clinic,
	attention_periods: [period_monday_1, period_monday_2],
	attention_time_length_hour: 0,
	attention_time_length_minutes: 15
)
medical_b = Medical.create(
	dni: "11042902",									cuil: "20-11042902-2",
	firstname: "Manuel", 							lastname: "Perez",
	home_phone: "47935551", 					movile_phone: "154487766",
	medical_specialization: oftalmologo,
	attention_periods: [period_monday_3, period_monday_4],
	attention_time_length_hour: 0,
	attention_time_length_minutes: 20
)
Medical.create(
	dni: "12042902",									cuil: "20-12042902-2",
	firstname: "Martin", 							lastname: "Gomez Gomenez",
	home_phone: "47935551", 					movile_phone: "154487766",
	medical_specialization: traumatologo,
	attention_periods: [period_monday_5, period_monday_6],
	attention_time_length_hour: 0,
	attention_time_length_minutes: 10
)
Medical.create(
	dni: "13042902",									cuil: "20-13042902-2",
	firstname: "Adrian", 							lastname: "Marino",
	home_phone: "47935551", 					movile_phone: "154487766",
	medical_specialization: pediatra,
	attention_periods: [period_monday_7, period_tuesday_7, period_wednesday_7, period_thursday_7, period_friday_7, period_saturday_7, period_saturday_7],
	attention_time_length_hour: 0,
	attention_time_length_minutes: 10,
	user: admin_user
)
Medical.create(
	dni: "14042902",									cuil: "20-14042902-2",
	firstname: "Cristian", 						lastname: "Molina",
	home_phone: "47935551", 					movile_phone: "154487766",
	medical_specialization: clinic,
	attention_periods: [period_monday_8, period_monday_9],
	attention_time_length_hour: 0,
	attention_time_length_minutes: 10
)
Medical.create(
	dni: "15042902",									cuil: "20-15042902-2",
	firstname: "Juan Pablo", 					lastname: "Ron",
	home_phone: "47935551", 					movile_phone: "154487766",
	medical_specialization: oftalmologo,
	attention_periods: [period_monday_10, period_monday_11],
	attention_time_length_hour: 0,
	attention_time_length_minutes: 10
)
Medical.create(
	dni: "16042902",									cuil: "20-16042902-2",
	firstname: "Felix", 							lastname: "Estrada",
	home_phone: "47935551", 					movile_phone: "154487766",
	medical_specialization: traumatologo,
	attention_periods: [period_monday_12, period_monday_13],
	attention_time_length_hour: 0,
	attention_time_length_minutes: 10
)
Medical.create(
	dni: "17042902",									cuil: "20-17042902-2",
	firstname: "Daniel", 							lastname: "Grosso",
	home_phone: "47935551", 					movile_phone: "154487766",
	medical_specialization: pediatra,
	attention_periods: [period_friday_14],
	attention_time_length_hour: 0,
	attention_time_length_minutes: 10
)
# -----------------------------------------------------------------------------
#
#
#
# -----------------------------------------------------------------------------
# Contacts...
# -----------------------------------------------------------------------------
contact_a = Contact.create(
	firstname: "Manuel",
	lastname: "Rodriguez",
	email: "manuel.rodriguez@gmail.com",
	home_phone: "47991111",
	movile_phone: "1589222222"
)
contact_b = Contact.create(
	firstname: "Juan",
	lastname: "Perez",
	email: "juan.perez@gmail.com",
	home_phone: "47991111",
	movile_phone: "1589222222"
)
# -----------------------------------------------------------------------------
#
#
#
# -----------------------------------------------------------------------------
# Patients...
# -----------------------------------------------------------------------------
patient_a = Patient.create(
	dni: "29042902",
	firstname: "Adrian Norberto",
	lastname: "Marino",
	birthdate: "22-09-1981",
	blood_type: "O_POSITIVE",
	height: "1.76",
	weight: "70",
	sex: "MALE",
	address: "Av.Rivadavia 102",
	email: "adrianmarino@gmail.com",
	home_phone: "43659876",
	movile_phone: "1134567345",
	contacts: [contact_a,contact_b]
)
patient_b = Patient.create(
	dni: "28381077",
	firstname: "Fernando",
	lastname: "Casabella",
	birthdate: "14-08-1980",
	blood_type: "B_POSITIVE",
	height: "1.76",
	weight: "73",
	sex: "MALE",
	address: "Av. Lacroze 3565",
	email: "fcasabella@gmail.com",
	home_phone: "45673421",
	movile_phone: "1167985432",
	contacts: [contact_a,contact_b]
)
patient_c = Patient.create(
	dni: "25789653",
	firstname: "Maria",
	lastname: "Cruz",
	birthdate: "14-08-1950",
	blood_type: "B_POSITIVE",
	height: "1.60",
	weight: "100",
	sex: "FALE",
	address: "Av. Cabildo 3010",
	email: "mariacruz@gmail.com",
	home_phone: "45671243",
	movile_phone: "1187609872",
	contacts: [contact_a,contact_b]
)
patient_d = Patient.create(
  dni: "30987123",
  firstname: "Javier",
  lastname: "Lopez",
  birthdate: "15-10-1900",
  blood_type: "B_POSITIVE",
  height: "1.80",
  weight: "80",
  sex: "MALE",
  address: "Besares 4563",
  email: "javilopez@gmail.com",
  home_phone: "48971234",
  movile_phone: "1178931298",
  contacts: [contact_a,contact_b]
)
patient_e = Patient.create(
  dni: "29987123",
  firstname: "Julian",
  lastname: "Gonzalez",
  birthdate: "15-10-1970",
  blood_type: "O_POSITIVE",
  height: "1.80",
  weight: "80",
  sex: "MALE",
  address: "Bulnes 4563",
  email: "juliangonzalez@gmail.com",
  home_phone: "48971232",
  movile_phone: "1177631298",
  contacts: [contact_a,contact_b]
)
patient_f = Patient.create(
  dni: "31287123",
  firstname: "Valeria",
  lastname: "Lopez",
  birthdate: "15-11-1999",
  blood_type: "B_POSITIVE",
  height: "1.61",
  weight: "56",
  sex: "FALE",
  address: "Vidal 4563",
  email: "valerialopez@gmail.com",
  home_phone: "48651234",
  movile_phone: "1166931298",
  contacts: [contact_a,contact_b]
)
patient_g = Patient.create(
  dni: "23944123",
  firstname: "Diego",
  lastname: "Diaz",
  birthdate: "15-10-1968",
  blood_type: "O_POSITIVE",
  height: "1.80",
  weight: "85",
  sex: "MALE",
  address: "Paroissiene 3563",
  email: "ddiaz@gmail.com",
  home_phone: "48971874",
  movile_phone: "1178965298",
  contacts: [contact_a,contact_b]
)
patient_h = Patient.create(
  dni: "30987823",
  firstname: "Javier",
  lastname: "Ruiz",
  birthdate: "15-11-1989",
  blood_type: "B_POSITIVE",
  height: "1.65",
  weight: "60",
  sex: "MALE",
  address: "Moldes 4363",
  email: "jruiz@gmail.com",
  home_phone: "48441234",
  movile_phone: "1178990298",
  contacts: [contact_a,contact_b]
)
patient_i = Patient.create(
  dni: "29987121",
  firstname: "Sofia",
  lastname: "Brun",
  birthdate: "11-01-1981",
  blood_type: "O_POSITIVE",
  height: "1.58",
  weight: "50",
  sex: "FALE",
  address: "Bauness 3212",
  email: "sofiabrun@gmail.com",
  home_phone: "47891234",
  movile_phone: "117665298",
  contacts: [contact_a,contact_b]
)

# -----------------------------------------------------------------------------
#
#
#
# -----------------------------------------------------------------------------
# Medical History...
# -----------------------------------------------------------------------------
medical_history_a = MedicalHistory.create patient: patient_a
medical_history_b = MedicalHistory.create patient: patient_b
medical_history_c = MedicalHistory.create patient: patient_c
medical_history_d = MedicalHistory.create patient: patient_d
medical_history_e = MedicalHistory.create patient: patient_e
medical_history_f = MedicalHistory.create patient: patient_f
medical_history_g = MedicalHistory.create patient: patient_g
medical_history_h = MedicalHistory.create patient: patient_h
medical_history_i = MedicalHistory.create patient: patient_i
# -----------------------------------------------------------------------------
#
#
#
# -----------------------------------------------------------------------------
# Allergies...
# -----------------------------------------------------------------------------
medical_history_a.allergies.create(
	record_date: '22-08-2013',
	cause: 'Alergia al polen'
)
medical_history_b.allergies.create(
	record_date: '10-06-2013',
	cause: 'Alergia a los acaros'
)
medical_history_c.allergies.create(
	record_date: '12-05-2012',
	cause: 'Alergia al pelo de animales'
)
medical_history_d.allergies.create(
	record_date: '01-11-2010',
	cause: 'Alergia a los analgesicos'
)
medical_history_e.allergies.create(
	record_date: '23-08-2009',
	cause: 'Alergia a las vitaminas.'
)
medical_history_f.allergies.create(
	record_date: '22-02-2008',
	cause: 'Alergia a picaduras de mosquito'
)
medical_history_g.allergies.create(
	record_date: '02-02-2001',
	cause: 'Alergia a alimentos, especialmente el huevo'
)
# -----------------------------------------------------------------------------
#
#
#
# -----------------------------------------------------------------------------
# Consultations...
# -----------------------------------------------------------------------------
medical_history_a.consultations.create(
	achievement_date: '12-01-2013',
	diagnostic: 'Otitis media aguda',
	symptomps: 'Dolor de oido y fiebre',
	treatment: 'Amoxicilina y analgesicos',
	medical: medical_a
)
medical_history_b.consultations.create(
	achievement_date: '23-05-2013',
	diagnostic: 'Gripe Aviar H1N1',
	symptomps: 'Fiebre alta de más de 38 grados, dificultad respiratoria, tos, malestar general.',
	treatment: 'Tamiflú',
	medical: medical_b
)
medical_history_c.consultations.create(
	achievement_date: '22-04-2013',
	diagnostic: 'Gastritis',
	symptomps: 'Dolor y vomitos',
	treatment: 'Dieta y Reliveran',
	medical: medical_a
)
medical_history_d.consultations.create(
	achievement_date: '01-10-2013',
	diagnostic: 'Otitis media aguda',
  symptomps: 'Dolor de oido y fiebre',
  treatment: 'Amoxicilina y analgesicos',
  medical: medical_b
)
medical_history_e.consultations.create(
	achievement_date: '25-03-2013',
  diagnostic: 'Gastritis',
  symptomps: 'Dolor y vomitos',
  treatment: 'Dieta y Reliveran',
  medical: medical_b
)
medical_history_f.consultations.create(
	achievement_date: '23-04-2013',
	diagnostic: 'Otitis media aguda',
  symptomps: 'Dolor de oido y fiebre',
  treatment: 'Amoxicilina y analgesicos',
  medical: medical_a
)
medical_history_g.consultations.create(
	achievement_date: '20-07-2013',
	diagnostic: 'Gastritis',
  symptomps: 'Dolor y vomitos',
  treatment: 'Dieta y Reliveran',
	medical: medical_b
)
medical_history_h.consultations.create(
	achievement_date: '21-08-2011',
	diagnostic: 'Otitis media aguda',
  symptomps: 'Dolor de oido y fiebre',
  treatment: 'Amoxicilina y analgesicos',
	medical: medical_a
)
medical_history_i.consultations.create(
  achievement_date: '12-08-2010',
  diagnostic: 'Diabetes',
  symptomps: 'Poliuria, Polidipsia',
  treatment: 'Insulina',
  medical: medical_a
)
# -----------------------------------------------------------------------------
#
#
#
# -----------------------------------------------------------------------------
# Antecedents...
# -----------------------------------------------------------------------------
medical_history_a.antecedents.create description: 'Broncoespasmo'
medical_history_b.antecedents.create description: 'Hipotiroidismo'
medical_history_c.antecedents.create description: 'Hipercolesterolemia'

medical_history_d.antecedents.create description: 'Dolores de Cabeza recurrentes'
medical_history_e.antecedents.create description: 'Tabaquismo'
medical_history_f.antecedents.create description: 'Etilismo'
# -----------------------------------------------------------------------------
#
#
#
# -----------------------------------------------------------------------------
# Diseases...
# -----------------------------------------------------------------------------
medical_history_a.diseases.create record_date: "12-12-2010", name: "Meningitis"
medical_history_b.diseases.create record_date: "01-11-2010", name: "Meningitis"
medical_history_c.diseases.create record_date: "12-09-2010", name: "Meningitis"

medical_history_d.diseases.create record_date: "02-11-2009", name: "Meningitis"
medical_history_e.diseases.create record_date: "13-08-2010", name: "Meningitis"
medical_history_f.diseases.create record_date: "12-10-1998", name: "Hepatitis B"

medical_history_g.diseases.create record_date: "12-09-2009", name: "Broncoespasmo"
medical_history_h.diseases.create record_date: "14-08-2012", name: "Artrocis"
medical_history_i.diseases.create record_date: "01-12-1998", name: "Hepatitis A"

medical_history_g.diseases.create record_date: "01-12-2012", name: "Broncoespasmo"
medical_history_h.diseases.create record_date: "06-01-2012", name: "Hepatitis A"
medical_history_i.diseases.create record_date: "08-11-2012", name: "Broncoespasmo"
# -----------------------------------------------------------------------------
#
#
#
# -----------------------------------------------------------------------------
# Medications...
# -----------------------------------------------------------------------------
medical_history_a.medications.create name: "Enalapril",
	dose: "1 Comprimido por día", amount: 5
medical_history_b.medications.create name: "Aspirineta",
	dose: "1 Comprimido por día", amount: 100
medical_history_c.medications.create name: "Omeprazol",
	dose: "1 Comprimido por día", amount: 20

medical_history_d.medications.create name: "Calcio",
	dose: "1 Comprimido por día", amount: 100
medical_history_e.medications.create name: "Aspirineta",
	dose: "1 Comprimido por día", amount: 100
medical_history_f.medications.create name: "Omeprazol",
	dose: "1 Comprimido por día", amount: 20

medical_history_g.medications.create name: "Clonazepan",
	dose: "1 Comprimido por día", amount: 100
medical_history_h.medications.create name: "Aspirineta",
	dose: "1 Comprimido cada 3 días", amount: 100
medical_history_i.medications.create name: "Omeprazol",
	dose: "1 Comprimido por día", amount: 20
# -----------------------------------------------------------------------------
#
#
#
# -----------------------------------------------------------------------------
# Vaccines...
# -----------------------------------------------------------------------------
medical_history_a.vaccines.create last_application: "10-01-1982", name: "BGC"
medical_history_a.vaccines.create last_application: "12-04-1987", name: "Meningitis"
medical_history_a.vaccines.create last_application: "13-11-1988", name: "Hepatitis B"
medical_history_a.vaccines.create last_application: "09-12-2012", name: "Influenza estacional"

medical_history_b.vaccines.create last_application: "09-12-1980", name: "BGC"
medical_history_b.vaccines.create last_application: "11-10-1986", name: "Meningitis"
medical_history_b.vaccines.create last_application: "12-10-1988", name: "Hepatitis B"
medical_history_b.vaccines.create last_application: "12-11-2002", name: "Influenza estacional"
# -----------------------------------------------------------------------------
#
#
#
# -----------------------------------------------------------------------------
# Medical exams...
# -----------------------------------------------------------------------------
medical_history_a.medical_exams.create( achievement_date: "01-10-1988",
	name: "Examen de sangre",results: "Ok")
medical_history_a.medical_exams.create( achievement_date: "04-10-2000",
	name: "Placa de torax", results: "Ok")
medical_history_a.medical_exams.create( achievement_date: "10-12-2012",
	name: "Examen de orina", results: "Ok")
medical_history_a.medical_exams.create( achievement_date: "25-12-2012",
	name: "Examen de electrocardiograma", results: "Ok")

medical_history_b.medical_exams.create( achievement_date: "13-12-2011",
	name: "Examen de sangre", results: "Ok")
medical_history_b.medical_exams.create( achievement_date: "16-12-2011",
	name: "Examen lumbar", results: "Ok")
medical_history_b.medical_exams.create( achievement_date: "18-12-2010",
	name: "Biopsia", results: "Ok")
medical_history_b.medical_exams.create( achievement_date: "19-12-2010",
	name: "Exámenes de radiología", results: "Ok")

medical_history_c.medical_exams.create( achievement_date: "20-12-2012",
	name: "Cultivo de garganta", results: "Ok")
medical_history_c.medical_exams.create( achievement_date: "21-12-2012",
	name: "Lumbar", results: "Ok")

medical_history_d.medical_exams.create( achievement_date: "22-12-2012",
	name: "Biopsia", results: "Ok")
medical_history_d.medical_exams.create( achievement_date: "28-12-2012",
	name: "Radiologico", results: "Ok")
# -----------------------------------------------------------------------------
#
#
#
# -----------------------------------------------------------------------------
# Attention times...
# -----------------------------------------------------------------------------
Appointment.create( 
	time: Time.now - 10.days,
	medical: medical_a,
	patient: patient_a,
	state: :reserved
)
Appointment.create(
	time: Time.now - 12.days,
	state: :attend,
	medical: medical_a,
	patient: patient_b,
)
Appointment.create(
	time: Time.now - 13.days,
	medical: medical_b,
	patient: patient_a,
	state: :reserved
)
Appointment.create(
	time: Time.now - 14.days,
	medical: medical_b,
	patient: patient_b,
	state: :reserved
)
Appointment.create(
	time: Time.now - 15.days,
	medical: medical_b,
	patient: patient_b,
	state: :reserved
)
Appointment.create(
	time: Time.now - 16.days,
	state: :reserved,
	medical: medical_b,
	patient: patient_a
)
# -----------------------------------------------------------------------------
#
#
#
# -----------------------------------------------------------------------------
# System Properties...
# -----------------------------------------------------------------------------
SystemProperty.new_window_size("20").save
# -----------------------------------------------------------------------------
#
#
#
# -----------------------------------------------------------------------------
# Refresh Indexes....
# -----------------------------------------------------------------------------
# Comment if not has installed and running elasticsearch server...
MedicalHistorySearchEngine.refresh_indexes
# -----------------------------------------------------------------------------
#
#
#
# -----------------------------------------------------------------------------
# Generate appointment window (Only for porduction deploy)...
# -----------------------------------------------------------------------------
AppointmentGeneratorTask.new.run if Rails.env == 'production'
# -----------------------------------------------------------------------------