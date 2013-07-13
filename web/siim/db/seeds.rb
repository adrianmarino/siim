# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Users...
user = User.create(dni: "29042902",first_name: "Adrian", last_name: "Marino", email: "adrianmarino@gmail.com", password: "29042902")
#user.confirm!
#user.save



# -----------------------------------------------------------------------------
# Medical specializations....
# -----------------------------------------------------------------------------
pediatra = MedicalSpecialization.create(name: "Pediatra")
traumatologo = MedicalSpecialization.create(name: "Traumatologo")
oftalmologo = MedicalSpecialization.create(name: "Oftalmologo")
clinic = MedicalSpecialization.create(name: "Clinico")



# -----------------------------------------------------------------------------
# Medicals...
# -----------------------------------------------------------------------------
Medical.create(
  dni: "10042902",									cuil: "20-10042902-2",
  firstname: "Juan Pedro", 					lastname: "Pepe",
  home_phone: "47935551", 					movile_phone: "154487766",
  medical_specialization: clinic
)
Medical.create(
  dni: "11042902",									cuil: "20-11042902-2",
  firstname: "Manuel", 							lastname: "Perez",
  home_phone: "47935551", 					movile_phone: "154487766",
  medical_specialization: oftalmologo
)
Medical.create(
  dni: "12042902",									cuil: "20-12042902-2",
  firstname: "Martin", 							lastname: "Gomez Gomenez",
  home_phone: "47935551", 					movile_phone: "154487766",
  medical_specialization: traumatologo
)
Medical.create(
  dni: "13042902",									cuil: "20-13042902-2",
  firstname: "Adrian", 							lastname: "Marino",
  home_phone: "47935551", 					movile_phone: "154487766",
  medical_specialization: pediatra
)
Medical.create(
  dni: "14042902",									cuil: "20-14042902-2",
  firstname: "Cristian", 						lastname: "Molina",
  home_phone: "47935551", 					movile_phone: "154487766",
  medical_specialization: clinic
)
Medical.create(
  dni: "15042902",									cuil: "20-15042902-2",
  firstname: "Juan Pablo", 					lastname: "Ron",
  home_phone: "47935551", 					movile_phone: "154487766",
  medical_specialization: oftalmologo
)
Medical.create(
  dni: "16042902",									cuil: "20-16042902-2",
  firstname: "Felix", 							lastname: "Estrada",
  home_phone: "47935551", 					movile_phone: "154487766",
  medical_specialization: traumatologo
)
Medical.create(
  dni: "17042902",									cuil: "20-17042902-2",
  firstname: "Daniel", 							lastname: "Grosso",
  home_phone: "47935551", 					movile_phone: "154487766",
  medical_specialization: pediatra
)



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
# Patients...
# -----------------------------------------------------------------------------
# Patient.create(
#   dni: "29042902",
#   firstname: "Manuel",
#   lastname: "Perez",
#   birthdate: ,
#   blood_type: :,
#   height:,
#   weight:,
#   sex:,
#   address:,
#   email:,
#   home_phone:,
#   movile_phone:,
#   contacts:
# )
