scheduler = Rufus::Scheduler.new
cron_time = "5 0 * * *"
puts ">> SIIM Scheduler: Schedule Attention Time generation every '#{cron_time}' (minutes|hours|month day|month|day of week)..."
scheduler.cron cron_time do
	AttentionTimeGeneratorTask.new.run
end
