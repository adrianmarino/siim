class AttentionTimeGeneratorTask
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def run
		show_begin_task
		show_parameters

		window_time = resolve_window_time

		if start_task? window_time
			builder = AttentionTimeBuilder.new
			show_window_time window_time
			builder.window_time = window_time

			show_medicals_header
			medicals = Medical.all
			show_medicals medicals
			sleep 1
			builder.medicals = medicals

			show_create_attention_times_header
			attention_times = builder.build

			show_save_attention_times_header

			attention_times.each do |a_attention_time| 
				a_attention_time.save
				show_attention_time a_attention_time
			end
		else
			show_not_run_process_message
		end
		show_end_task
	end


	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def last_attetion_date
		time = AttentionTime.last
		time.nil? ? Date.yesterday : time.to_date
	end

	def window_size
		SystemProperty.window_size_value
	end

	def resolve_window_time
		AttentionWindowTime.new_from last_attetion_date, window_size
	end

	def start_task?(window_time)
		!window_time.nil? and window_time.from != window_time.to
	end

	def show_parameters
		today = Time.now
		puts "\n\s\s------------------------"
		puts "\s| Process Information... |"
		puts "\s\s------------------------"
		puts "\s\s-\sAttention Window Size: #{window_size} day/s."
		puts "\s\s-\sToday: #{today.strftime("%F %H:%M")}."
		last_time = AttentionTime.last
		if last_time.nil?
			puts "\s\s-\sNo exist previous attention times."
		else
			diference = last_time - today
			puts "\s\s-\sLast Attention Time: #{last_time.strftime("%F %H:%M")}."
			puts "\s\s-\sDiference between 'Last Attention Time' and 'Today': #{diference.duration}."
		end
	end

	def show_not_run_process_message
		puts "\n\s\s---------------------------------------------------------------------------"
		puts "\s| Information:                                                              |"
		puts "\s| No need to create new attention times, window attention time is complete! |"
		puts "\s\s---------------------------------------------------------------------------\n\n"
	end

	def show_medicals(medicals)
		medicals.each do |a_medical|
		  puts "\s\s-\sMedical: #{a_medical}"
		  a_medical.attention_periods.each do|a_period| puts "\s\s\s\s-\s#{a_period}" end
		end
	end

	def show_window_time(window_time)
		puts "\s\s-\sWindow Time:\sFrom #{window_time.from}\sto #{window_time.to}."
	end

	def show_medicals_header
		puts "\n\s\s---------------------"
		puts "\s| Get all medicals... |"
		puts "\s\s---------------------"
	end

	def show_create_attention_times_header
		puts "\n\s\s-----------------------------"
		puts "\s| Generate attention times... |"
		puts "\s\s-----------------------------"
		sleep 1
	end

	def show_save_attention_times_header
		puts "\n\s\s-------------------------"
		puts "\s| Save attention times... |"
		puts "\s\s-------------------------"
	end

	def show_begin_task
		puts "\nBegin Attention times generation..."
	end

	def show_end_task
		puts "\nEnd Attention times generation...\n"
	end

	def show_attention_time(attention_time)
		puts "\s\s-\s#{attention_time}"
	end
end