desc "Deploy to apache"
task :redeploy do
	Rake::Task["db:reset"].invoke

	# apache_path = "/var/www/sim"
	apache_path = "/home/adrian/var/www/sim"

	puts "Remove old version..."
	system "rm -rf #{apache_path}/*"
	system "sleep 5"

	puts "Copy new version to apache docs path..."
	system "cp -rf * #{apache_path}/"
	system "sleep 5"

	puts "Restart application on apache..."
	system "touch #{apache_path}/tmp/restart.txt"
end