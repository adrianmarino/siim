class Reportes 

#--------------------------------#
# Consultas de la clase Reportes #
#--------------------------------#


#------------------------------------------------------------------------------------------#
# Consulta_1: Mostrar porcentaje de pacientes con "X" sintomas sobre la poblacion total    #
#------------------------------------------------------------------------------------------#
def consulta_1(sintoma)
	a = Patient.count(:dni)
    b = Consultation.where("symptomps = ?", sintoma).count(:symptomps)
    
    total = (((b.to_f)/a)*100)

    puts total
end

#------------------------------------------------------------------------------------------#
# Consulta_2: Mostrar cantidad de pacientes con "X" sintomas para un año en particular     #
#------------------------------------------------------------------------------------------#
def consulta_2(sintoma, anio)
    return Patient.joins('INNER JOIN consultations ON consultations.medical_history_id = patients.medical_history_id').where("consultations.symptomps = ? AND strftime('%Y',consultations.created_at) = ?",sintoma,anio).count
end

#---------------------------------------------------------------------------------------------#
# Consulta_3: Mostrar porcentaje de pacientes con una enfermedad "X" sobre la poblacion total #
#---------------------------------------------------------------------------------------------#
def consulta_3(enfermedad)
	a = Patient.count(:dni)
    b = Patient.joins('INNER JOIN diseases ON diseases.medical_history_id = patients.medical_history_id').where("diseases.name = ?",enfermedad).count
    
    total = (((b.to_f)/a)*100)

    puts total

end

#-------------------------------------------------------------------------------------------#
# Consulta_4: Mostrar cantidad de pacientes con una enfermedad "X" para un año en particular#
#-------------------------------------------------------------------------------------------#
def consulta_4(enfermedad, anio)
	
a = Patient.joins('INNER JOIN diseases ON diseases.medical_history_id = patients.medical_history_id').where("diseases.name = ? AND strftime('%Y',diseases.created_at) = ?",enfermedad,anio).count
      
puts a

end

#----------------------------------------------------------------------------------------#
# Consulta_5: Tipos de tratamientos utilizados para un sintoma "x" particular            #
#----------------------------------------------------------------------------------------#
def consulta_5 (sintoma)

a = Consultation.select(:treatment).where("consultations.symptomps = ?",sintoma)	

puts a

end


end