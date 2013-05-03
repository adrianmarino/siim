desc "Start Application Server with application on testing environment"
task :start_server do
	puts 'Start Application Server...'
#	system('rails server --daemon --environment=test')
	system('rails server --daemon')
end

desc "Stop Application Server"
task :stop_server do
	puts 'Stop Application Server...'
  system('kill -9 $(cat tmp/pids/server.pid)')
end

Rake::TestTask.new :acceptance_test => [:start_server] do |a_task|
  
  Rake::Task["db:reset"].invoke

  a_task.libs << "test"
  a_task.test_files = FileList['test/acceptance/*_test.rb']
  a_task.verbose = false
end

Rake::Task["acceptance_test"].enhance do
	Rake::Task["stop_server"].invoke
end
