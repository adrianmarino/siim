class ApplicationConfiguration
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def log_path
		@config['log_path'][Rails.env]
	end

	def highlight_begin
		@config['search_engine']['highlight']['begin']
	end

	def highlight_end
		@config['search_engine']['highlight']['end']
	end

	def version
		@config['app']['version']
	end

	def mailer_password
		@config['mailer']['password']
	end

	def appointment_genetator_task_time
		@config['scheduler']['appointment_genetator_task_time']
	end

	def search_engine_username
		@config['search_engine']['user']['username']
	end

	def search_engine_password
		@config['search_engine']['user']['password']
	end

	def print_all
		puts "----------------------------------------------------------------------"
		puts "Application Configuration"
		puts "----------------------------------------------------------------------"
		puts "\s-\slog_path: #{log_path}"
		puts "\s-\shighlight_begin: #{highlight_begin}"
		puts "\s-\shighlight_end: #{highlight_end}"
		puts "\s-\sversion: #{version}"
		puts "\s-\smailer_password: #{mailer_password}"
		puts "\s-\sappointment_genetator_task_time: #{appointment_genetator_task_time}"
		puts "\s-\ssearch_engine_username: #{search_engine_username}"
		puts "\s-\ssearch_engine_password: #{search_engine_password}"
		puts "----------------------------------------------------------------------"
	end

	# -------------------------------------------------------------------------
	# Initialize...
	# -------------------------------------------------------------------------
	def initialize(a_path)
		@config = YAML.load_file "#{Rails.root}#{a_path}"
		print_all if Rails.env == 'development'
	end
end
