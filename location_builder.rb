require './location'

class LoctionBuilder
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def argentina
		country 'Argentina'
	end

	def buenos_aires
		city 'Buenos Aires'
	end

	def manuela_pedraza_2529
		address 'Manuela Pedraza 2529'
	end

	def medrano_951
		address 'Medrano 951'
	end

	def country(a_country)
		@country = a_country
		self
	end

	def city(a_city)
		@city = a_city
		self
	end

	def address(an_address)
		@address = an_address
		self
	end

	def build
		Location.new @address, @city, @country
	end
end