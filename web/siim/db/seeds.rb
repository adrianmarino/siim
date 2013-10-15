# encoding: utf-8
# -----------------------------------------------------------------------------
#
#
#
# -----------------------------------------------------------------------------
# Delete Indexes....
# -----------------------------------------------------------------------------
Tire.index('medical_histories').delete
#
#
#
# -----------------------------------------------------------------------------
# users....
# -----------------------------------------------------------------------------
user = User.create(dni: "29042902",first_name: "Adrian", last_name: "Marino", email: "adrianmarino@gmail.com", password: "29042902")
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
medical_history = MedicalHistory.create(patient: patient_a)
medical_history = MedicalHistory.create(patient: patient_b)
#
#
#
# -----------------------------------------------------------------------------
# Allergies...
# -----------------------------------------------------------------------------
Allergy.create(
  cause: 'Causa 1',
  medical_history: medical_history
)
Allergy.create(
  cause: 'Causa 2',
  medical_history: medical_history
)
Allergy.create(
  cause: 'Causa 3',
  medical_history: medical_history
)
#
#
#
# -----------------------------------------------------------------------------
# Consultations...
# -----------------------------------------------------------------------------
Consultation.create(
  achievement_date: '22-08-2013', 
  diagnostic: 'Diagnostico',
  symptomps: 'Sintomas',
  treatment: 'Tratamiento',
  medical_history: medical_history
)
Consultation.create(
  achievement_date: '23-08-2013', 
  diagnostic: 'Diagnostico 2',
  symptomps: 'Sintomas 2',
  treatment: 'Tratamiento 1',
  medical_history: medical_history
)
#
#
#
# -----------------------------------------------------------------------------
# Antecedents...
# -----------------------------------------------------------------------------
Antecedent.create(
  description: 'Descripción 1',
  medical_history: medical_history
)
Antecedent.create(
  description: 'Descripción 2',
  medical_history: medical_history
)
Antecedent.create(
  description: 'Descripción 3',
  medical_history: medical_history
)
#
#
#
# -------------------------------------------------------------------------
# Diseases...
# -------------------------------------------------------------------------
Disease.create(
  name: "Reuma",
  medical_history: medical_history 
)
Disease.create(
  name: "Artrocis",
  medical_history: medical_history 
)
Disease.create(
  name: "Epatitis",
  medical_history: medical_history 
)
#
#
#
# -------------------------------------------------------------------------
# Medications...
# -------------------------------------------------------------------------
Medication.create(
  name: "Polper B12 Forte",
  dose: "1 Comprimido por día",
  amount: 100,
  medical_history: medical_history 
)
Medication.create(
  name: "Aspirina",
  dose: "1 Comprimido por día",
  amount: 200,
  medical_history: medical_history 
)
Medication.create(
  name: "Omeprazol",
  dose: "1 Comprimido por día",
  amount: 300,
  medical_history: medical_history 
)
#
#
#
# -------------------------------------------------------------------------
# Vaccines...
# -------------------------------------------------------------------------
Vaccine.create(
  last_application: "12-12-2012",
  name: "Vacuna 1",
  medical_history: medical_history
)
Vaccine.create(
  last_application: "12-12-2002",
  name: "Vacuna 2",
  medical_history: medical_history
)
#
#
#
# -------------------------------------------------------------------------
# Medical exams...
# -------------------------------------------------------------------------
MedicalExam.create(
  achievement_date: "12-12-2012",
  name: "Examen 1",
  medical_history: medical_history
)
MedicalExam.create(
  achievement_date: "12-12-2012",
  name: "Examen 2",
  medical_history: medical_history
)
MedicalExam.create(
  achievement_date: "12-12-2012",
  name: "Examen 3",
  medical_history: medical_history
)
#
#
#
# -------------------------------------------------------------------------
# Attention times...
# -------------------------------------------------------------------------
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
# -------------------------------------------------------------------------
# System Properties...
# -------------------------------------------------------------------------
SystemProperty.new_window_size("20").save
