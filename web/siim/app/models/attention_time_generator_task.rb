class AttentionTimeGeneratorTask
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def run
		window_time = resolve_window_time

		if !window_time.nil? and window_time.from != window_time.to
			puts "Begin Attention time generation..."
			builder = AttentionTimeBuilder.new
			puts "Window Time:\n\s-\sFrom: #{window_time.from}\n\s-\sTo: #{window_time.to}"
			builder.window_time = window_time
			
			puts "Get all medicals..."
			medicals = Medical.all
			medicals.each do |a_medical|
				puts "\s-\sMedical: #{a_medical}"
				a_medical.attention_periods.each do|a_period| puts "\s\s-\s#{a_period}" end
			end
			builder.medicals = medicals

			puts "Create attention times..."
			attention_times = builder.build

			puts "Save attention times..."
			attention_times.each do |a_attention_time| 
				a_attention_time.save
				puts "\s-\s#{a_attention_time}"
			end
			puts "End Attention time generation..."
		else
			puts "No need to create new attention times. Window attention time is complete."
		end
	end


	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def last_attetion_date
		times = AttentionTime.last
		times.empty? ? Date.yesterday : times.first.time.to_date
	end

	def window_size
		SystemProperty.window_size_value
	end

	def resolve_window_time
		AttentionWindowTime.new_from last_attetion_date, window_size
	end
end