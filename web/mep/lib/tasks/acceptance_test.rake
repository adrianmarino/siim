task :setup_display, [ :display ] => :environment do |t, args|
    ENV['DISPLAY'] = args[:display] if args[:display]
    puts "Display: " + ENV['DISPLAY']
end

Rake::TestTask.new :acceptance_test => [:start_test_server,:setup_display] do |a_task|
  Rake::Task["db:reset"].invoke

  a_task.libs << "test"
  a_task.test_files = FileList['test/acceptance/*_test.rb']
  a_task.verbose = false
end

Rake::Task["acceptance_test"].enhance do
	Rake::Task["stop_test_server"].invoke
end
