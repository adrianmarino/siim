class SearchEngineController < ApplicationController
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def administrate
		authorize! :admin, :search_engine
		redirect_to plugin_url_for :head
	end

	def query_debug
		authorize! :admin, :search_engine
		redirect_to plugin_url_for :inquisitor
	end

	def statistics
		authorize! :admin, :search_engine
		redirect_to plugin_url_for :bigdesk
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def plugin_url_for(a_plugin_name)
		"#{APP_CONFIG.search_engine_plugin_url}/#{a_plugin_name}"
	end
end