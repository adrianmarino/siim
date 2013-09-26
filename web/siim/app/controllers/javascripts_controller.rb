class JavascriptsController < ApplicationController
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def dinamic_medicals
		@medicals = Medical.all
	end
end
