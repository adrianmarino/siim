desc "Deploy to apache"
task :redeploy => [:reset_db] do
	apache_path = "/var/www/siim"

	puts " -------------------------------------------"
	puts "| Remove old version on apache docs path... |"
	puts " -------------------------------------------"
	system "rm -rvf #{apache_path}/*"
	system "sleep 5"

	puts " -----------------------------------------"
	puts "| Copy new version to apache docs path... |"
	puts " -----------------------------------------"
	system "cp -rvf * #{apache_path}/"
	system "sleep 5"

	puts " ----------------------------------"
	puts "| Restart application on apache... |"
	puts " ----------------------------------"
	system "mkdir #{apache_path}/tmp"
	system "touch #{apache_path}/tmp/restart.txt"
end
