desc "Deploy to apache"
task :redeploy => [:migrate_db] do
	apache_path = "/var/www/siim"

	puts "Remove old version on apache docs path..."
	system "rm -rvf #{apache_path}/*"
	system "sleep 5"

	puts "Copy new version to apache docs path..."
	system "cp -rvf * #{apache_path}/"
	system "sleep 5"

	puts "Restart application on apache..."
	system "mkdir #{apache_path}/tmp"
	system "touch #{apache_path}/tmp/restart.txt"
end