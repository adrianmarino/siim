class AttentionTimeController  < ApplicationController
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def setup_search
		@attention_times = AttentionTime.all
		render 'attention_times/setup_search'
	end

	def search
	end

	def daily_attention_times
		render 'attention_times/daily_attention_times'
	end
end