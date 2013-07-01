# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Users...
user = User.create(dni: "29042902",first_name: "Adrian", last_name: "Marino", email: "adrianmarino@gmail.com", password: "29042902")
user.confirm!
user.save

# Medical specializations....
MedicalSpecialization.create(name: "Pediatra")
MedicalSpecialization.create(name: "Traumatologo")
MedicalSpecialization.create(name: "Oftalmologo")
clinic = MedicalSpecialization.create(name: "Clinico")

# Medicals...
for index in 1..20
  Medical.create(
    cuil: "#{index}-29042902-2",
    dni: "#{index}042902",
    firstname: "Juan Pedro #{index}",
    lastname: "Pepe #{index}",
    home_phone: "47935551",
    movile_phone: "154487766",
    medical_specialization: clinic
  )
end
