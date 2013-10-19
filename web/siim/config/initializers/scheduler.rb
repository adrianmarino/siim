scheduler = Rufus::Scheduler.new

cron_time = APP_CONFIG['scheduler']['appointment_genetator_task_time']

puts ">> SIIM Scheduler: Schedule Attention Time generation every '#{cron_time}' (minutes|hours|month day|month|day of week)..."
scheduler.cron cron_time do
	AppointmentGeneratorTask.new.run
end
