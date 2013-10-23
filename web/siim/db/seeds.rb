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
# users....
# -----------------------------------------------------------------------------
user = User.create  dni: "29042902",first_name: "Adrian", last_name: "Marino", 
                    email: "adrianmarino@gmail.com", password: "29042902"
User.create   dni: "77777777",first_name: "Demo 1", last_name: "Demo 1",
              email: "marquez.ezequiel19@gmail.com", password: "usrDemo1"
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
  user: user
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
  address: "Pepes 102",
  email: "adrianmarino@gmail.com",
  home_phone: "99999999",
  movile_phone: "88888888",
  contacts: [contact_a,contact_b]
)
patient_b = Patient.create(
  dni: "28381077",
  firstname: "Fernando",
  lastname: "Casabella",
  birthdate: "14-08-1980",
  blood_type: "B_POSITIVE",
  height: "1.70",
  weight: "60",
  sex: "MALE",
  address: "algun lugar",
  email: "fcasabella@gmail.com",
  home_phone: "444334444",
  movile_phone: "1122233344",
  contacts: [contact_a,contact_b]
)
#
#
#
# -----------------------------------------------------------------------------
# Medical History...
# -----------------------------------------------------------------------------
medical_history_a = MedicalHistory.create(patient: patient_a)
medical_history_b = MedicalHistory.create(patient: patient_b)
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
medical_history_a.allergies.create(
  record_date: '22-08-2013',
  cause: 'Alergia a los acaros'
)
medical_history_a.allergies.create(
  record_date: '22-08-2013',
  cause: 'Alergia al pelo de animales'
)
medical_history_b.allergies.create(
  record_date: '22-08-2013',
  cause: 'Alergia a los medicamente. Especialmente al rivotril'
)
medical_history_b.allergies.create(
  record_date: '22-08-2013',
  cause: 'Alergia a las picaduras de insectos. Mosquitos, cocogrilos.'
)
medical_history_b.allergies.create(
  record_date: '22-08-2013',
  cause: 'Alergia a los animales. Todos, seres humanos incluidos.'
)
#
#
#
# -----------------------------------------------------------------------------
# Consultations...
# -----------------------------------------------------------------------------
medical_history_a.consultations.create(
  achievement_date: '22-08-2013',
  diagnostic: 'Fractura expuesta de tobillo',
  symptomps: 'Dificulta al caminar',
  treatment: 'Enyesado. Reposo por 2 meses'
)
medical_history_a.consultations.create(
  achievement_date: '23-08-2013',
  diagnostic: 'Gripe Aviar H1N1',
  symptomps: 'Fiebre alta de más de 38 grados, dificultad respiratoria, tos, malestar general.',
  treatment: 'Tamiflú y Ralenza'
)
medical_history_b.consultations.create(
  achievement_date: '22-08-2013',
  diagnostic: 'Descompesación gastrica menor',
  symptomps: 'Mareos y vómito',
  treatment: 'Reliveran'
)
medical_history_b.consultations.create(
  achievement_date: '23-08-2013',
  diagnostic: 'Diagnostico 2',
  symptomps: 'Sintomas 2',
  treatment: 'Tratamiento 1'
)
#
#
#
# -----------------------------------------------------------------------------
# Antecedents...
# -----------------------------------------------------------------------------
medical_history_a.antecedents.create description: 'Fractura de tivia y perone'
medical_history_a.antecedents.create description: 'Gripe Aviar H1N1'
medical_history_a.antecedents.create description: 'Hepatitis B'

medical_history_b.antecedents.create description: 'Dolores de Cabeza recurrentes'
medical_history_b.antecedents.create description: 'Estrés'
medical_history_b.antecedents.create description: 'Padres separados'
#
#
#
# -----------------------------------------------------------------------------
# Diseases...
# -----------------------------------------------------------------------------
medical_history_a.diseases.create record_date: "12-12-2012", name: "Reuma"
medical_history_a.diseases.create record_date: "12-12-2012", name: "Artrocis"
medical_history_a.diseases.create record_date: "12-12-2012", name: "Hepatitis"

medical_history_b.diseases.create record_date: "12-12-2012", name: "Reuma"
medical_history_b.diseases.create record_date: "12-12-2012", name: "Artrocis"
medical_history_b.diseases.create record_date: "12-12-2012", name: "Hepatitis"
#
#
#
# -----------------------------------------------------------------------------
# Medications...
# -----------------------------------------------------------------------------
medical_history_a.medications.create name: "Polper B12 Forte", dose: "1 Comprimido por día", amount: 100
medical_history_a.medications.create name: "Aspirina", dose: "1 Comprimido por día", amount: 200
medical_history_a.medications.create name: "Omeprazol", dose: "1 Comprimido por día", amount: 300

medical_history_b.medications.create name: "Polper B12 Forte", dose: "1 Comprimido por día", amount: 100
medical_history_b.medications.create name: "Aspirina", dose: "1 Comprimido por día", amount: 200
medical_history_b.medications.create name: "Omeprazol", dose: "1 Comprimido por día", amount: 300
#
#
#
# -----------------------------------------------------------------------------
# Vaccines...
# -----------------------------------------------------------------------------
medical_history_a.vaccines.create last_application: "12-12-2012", name: "BGC"
medical_history_a.vaccines.create last_application: "12-12-2002", name: "Hepatitis B HB"
medical_history_a.vaccines.create last_application: "12-12-2002", name: "Gripe"
medical_history_a.vaccines.create last_application: "12-12-2002", name: "Neumococo Conjugada"

medical_history_b.vaccines.create last_application: "12-12-2012", name: "Sabin OPV"
medical_history_b.vaccines.create last_application: "12-12-2002", name: "VPH"
medical_history_b.vaccines.create last_application: "12-12-2002", name: "Gripe"
medical_history_b.vaccines.create last_application: "12-12-2002", name: "Neumococo Conjugada"
#
#
#
# -----------------------------------------------------------------------------
# Medical exams...
# -----------------------------------------------------------------------------
medical_history_a.medical_exams.create( achievement_date: "12-12-2012",
  name: "Examen de sangre",results: "Ok")
medical_history_a.medical_exams.create( achievement_date: "12-12-2012",
  name: "Análisis de heces", results: "Ok")
medical_history_a.medical_exams.create( achievement_date: "12-12-2012",
  name: "Examen de orina", results: "Ok")
medical_history_a.medical_exams.create( achievement_date: "12-12-2012",
  name: "Examen de electrocardiografía", results: "Ok")


medical_history_b.medical_exams.create( achievement_date: "12-12-2012",
  name: "Examen de cultivo de garganta", results: "Ok")
medical_history_b.medical_exams.create( achievement_date: "12-12-2012",
  name: "Examen lumbar", results: "Ok")
medical_history_b.medical_exams.create( achievement_date: "12-12-2012",
  name: "Biopsia", results: "Ok")
medical_history_b.medical_exams.create( achievement_date: "12-12-2012",
  name: "Exámenes de radiología", results: "Ok")
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
  state: :reserved
)
Appointment.create(
  time: Time.now - 13.days,
  medical: medical_b,
  patient: patient_a,
  state: :reserved
)
Appointment.create(
  time: Time.now - 14.days,
  state: :reserved,
  medical: medical_b,
  patient: patient_b,
  state: :reserved
)
Appointment.create(
  time: Time.now - 15.days,
  state: :reserved,
  medical: medical_b,
  patient: patient_b,
  state: :reserved
)
Appointment.create(
  time: Time.now - 16.days,
  state: :reserved,
  medical: medical_b,
  patient: patient_a,
  state: :reserved
)
#
#
#
# -----------------------------------------------------------------------------
# System Properties...
# -----------------------------------------------------------------------------
SystemProperty.new_window_size("20").save
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