## Ejecutar la aplicación

Para ejecutar la aplicación se debe ejecutar los siguentes comandos en order:

1. **db_recreate**
2. **start\_server\_on\_debug**


## Helper Scripts

* **db\_recreate**: Borra la base de datos completa y la vuelve a crear agregando los datos de prueba declarados en el archivo db/seeds.rb.
* **db\_migrate**:  Es usado para modificar la base de datos cuando se agregan nuevas entidades o relaciones entre estas.
* **start\_server\_on\_debug**: Levanta a aplicación en un servidor local 
(http://localhost:3000) en modo debug perminitendo utilizar un debuger.
* **update-javascript-translations**: Actualiza las traducciones que se usan en el código javascript comando como fuente los archivos que encuentran en config/locals.
* **start\_app\_engine**: Levanta el motor de la aplicación en un interprete. De esta manera se puede ejecutar el código de la aplicación, ya sea para consultar entidades, probar el comportamiento de objetos, crear nuevos objetos. Es similar al workspace de Pharo/Squeak Smalltalk.

## Consulta de resumen de historia clínica

### Login

Para iniciar sesión en la aplicación se debe ejecutar el siguiente comando. 

```
curl -X POST 'http://siim.bambusolutions.com.ar/login.json' \
 -d 'user[login]=un_email_o_dni&user[password]=una_contraseña
```

Parámetros:

* un_email_o_dni
* una_contraseña

Este comando genera un token de sesión que luego es utilizado para realizar consultas al sistema.

Un ejemplo de uso:

* Comando:
	
	```
	curl -X POST 'http://siim.bambusolutions.com.ar/login.json' |
	-d 'user[login]=adrianmarino@gmail.com&user[password]=29042902'
	```
* Respuesta: `{"response":"ok","auth_token":"3AwsFwHxTqmy9yTcu11G"}`

### Consulta de resumen de historia clínica

Mediante el DNI del paciente se puede obtener un resumen de su historia clínica.
La consulta se puede realizar de la siguiente manera:

```
curl -L 'http://siim.bambusolutions.com.ar/medical_histories/search_by_dni?query=un_dni&auth_token=un_token'
```

Parámetros:

* un_dni
* un_token

Luego, el server responde en JSON.

Un ejemplo de uso:

* Comando:
```
curl -L 'http://siim.bambusolutions.com.ar/medical_histories/search_by_dni?query=29042902&auth_token=3AwsFwHxTqmy9yTcu11G'
```
* Resultado de la consulta:

	```
	{
		"id":1,
		"patient": {
			"address":"Pepes 102",
			"birthdate":"1981-09-22",
			"blood_type":"O_POSITIVE",
			"dni":"29042902",
			"email":"adrianmarino@gmail.com",
			"firstname":"Adrian Norberto",
			"height":"1,76",
			"home_phone":"99999999",
			"lastname":"Marino",
			"movile_phone":"88888888",
			"sex":"MALE",
			"weight":"70.0"
		},
		"allergies":[
			{"cause":"Causa 1"},
			{"cause":"Causa 2"},
			{"cause":"Causa 3"}
		],
		"antecedents":[
			{"description":"Descripci\u00f3n 1"},
			{"description":"Descripci\u00f3n 2"},
			{"description":"Descripci\u00f3n 3"}
		],
		"consultations":[
			{"diagnostic":"Diagnostico"},
			{"diagnostic":"Diagnostico 2"}
		],
		"diseases":[
			{"name":"Reuma"},
			{"name":"Artrocis"},
			{"name":"Epatitis"}
		],
		"medications":[
			{"dose":"1 Comprimido","how_often":"Una vez por d\u00eda","name":"Polper B12 Forte"},
			{"dose":"1 Comprimido","how_often":"Una vez por semana","name":"Aspirina"},
			{"dose":"1 Comprimido","how_often":"Una vez por d\u00eda","name":"Omeprazol"}
		],
		"vaccines":[
			{"last_application":"2012-12-12","name":"Vacuna 1"},
			{"last_application":"2002-12-12","name":"Vacuna 2"}
		],
		"medical_exams":[
			{"achievement_date":"2012-12-12","name":"Examen 1"},
			{"achievement_date":"2012-12-12","name":"Examen 2"},
			{"achievement_date":"2012-12-12","name":"Examen 3"}
		]
	}
	```

### Nueva base de datos

Para levantar la aplicación por primera vez, es necesario crear un schema en mysql. Para esto correr las siguientes sentencias:

```sql
CREATE DATABASE siim CHARACTER SET utf8;
CREATE USER 'siim'@'localhost' IDENTIFIED BY 'un_password';
GRANT ALL PRIVILEGES ON siim.* TO 'siim'@'localhost';
```
