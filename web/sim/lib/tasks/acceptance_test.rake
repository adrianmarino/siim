task :setup_display, [ :display ] => :environment do |t, args|
	ENV['DISPLAY'] = args[:display] if args[:display]
end

task :reset_test_db do |t, args|
	Rake::Task['db:reset'].invoke
	Rake::Task['db:migrate'].invoke
end

Rake::TestTask.new :acceptance_test => [:reset_test_db, :stop_test_server, :start_test_server,:setup_display] do |a_task|
  a_task.libs << "test"
  a_task.test_files = FileList['test/acceptance/*_test.rb']
  a_task.verbose = false
end

Rake::Task["acceptance_test"].enhance do
	Rake::Task["stop_test_server"].invoke
end
