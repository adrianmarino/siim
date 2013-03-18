# -----------------------------------------------------------------------------
# ¿COMO FUNCIONA ESTE EJEMPLO?
# -----------------------------------------------------------------------------
# Para ver como funciona la clase "GoogleMapsServiceClient" se puede
# ver el codigo del método "test_distance_and_time" de la clase 
# "GoogleMapsServiceClientUnitTest" (ES la ultima clase en el archivo).
# -----------------------------------------------------------------------------
#
#
#
#
# -----------------------------------------------------------------------------
# ¿COMO EJECUTO ESTE CODIGO?
# -----------------------------------------------------------------------------
# 1. Primero hay que instalar la gema "httparty" para poder correr el ejemplo.
#    Para esto hay que ejecutar el siguente comando en consola: 
#    "gem install httparty".
#
# 2. Luego ejecutar la prueba del codigo con el siguiente comando: 
#    "ruby google_maps_get_distime_time_example.rb".
#
# 3. Por último, se puede visualisar el resultado del test en un recuadro como
#    el que sigue:
#
#		 ---------------------
#		 Show test information
#		 -------------------------------------------------------
#		 - driving from Manuela Pedraza 2529 to Medrano 951.
#		 - you will arrive in 23 min and distance is 8,0 km.
#		 - Time: 1406 seconds, Distance: 8048 mts.
#		 -------------------------------------------------------
#
# -----------------------------------------------------------------------------
require 'test/unit'
require './google_maps_service'
require './location'
require './location_builder'

class GoogleMapsServiceClientTestUnit < Test::Unit::TestCase

	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------
	def test_distance_and_time
		# Prepare test...
		travel_mode = 'driving'
		#travel_mode = 'walking'
		source_location = new_location 'Manuela Pedraza 2529'
		destiny_location = new_location 'Medrano 951'

		# Perform test...
		respose = @target.distante_and_time source_location, destiny_location, travel_mode

		# Asserts...
		assert_distance 8048, respose
		assert_time 1406, respose

		# Show results...
		show_results travel_mode, source_location, destiny_location, respose
	end

	def setup
		@target = new_service_in_spanish
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def assert_distance(an_expected_distance, distante_time)
		assert_equal an_expected_distance, distante_time.distance  # In km...
	end

	def assert_time(an_expected_time, distante_time)
		assert_equal an_expected_time, distante_time.time # In seconds...		
	end

	def new_service_in_spanish
		language = 'es-AR'

		# Create client...
		GoogleMapsServiceClient.new language
	end

	def new_location(a_address)
		LoctionBuilder.new.address(a_address).buenos_aires.argentina.build
	end

	def show_results(a_travel_mode, a_source_location, a_destiny_location,a_result)
		# Show froms and to...
		puts "\n - #{a_travel_mode} from #{a_source_location.address} to #{a_destiny_location.address}."

		# Show distante and time...
		puts " - you will arrive in #{a_result.time_text} and distance is #{a_result.distance_text}."
		puts " - Time: #{a_result.time} seconds, Distance: #{a_result.distance} mts."
	end
end
