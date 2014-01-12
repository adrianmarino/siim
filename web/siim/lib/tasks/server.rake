desc "Start server on test"
task :start_test_server do
	puts 'Start server on test...'
	system('rails server --daemon --environment=test')
end

desc "Stop server on test"
task :stop_test_server do
	puts 'Stop server on test...'
	system('kill -9 $(cat tmp/pids/server.pid)')
end

desc "Restart server on dev"
task :restart_server do
	Rake::Task["stop_server"].invoke

	puts 'Start server on dev...'
	system('rails server --daemon --port 9999')
end

desc "Stop server"
task :stop_server do
	puts 'Stop server...'
	system('kill -9 $(cat tmp/pids/server.pid)')
end
