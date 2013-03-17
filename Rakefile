Rake::TestTask.new(:fast) do |t|
  files = if ENV['TEST_FILES']
      ENV['TEST_FILES'].split(',')
        else
	    FileList["test/unit/**/*_test.rb", "test/functional/**/*_test.rb", "test/integration/**/*_test.rb"]
	      end

	        t.libs << 'test'
		  t.verbose = true
		    t.test_files = files
		    end
		    Rake::Task['test:fast'].comment = "Runs unit/functional/integration tests (or a list of files in TEST_FILES) in one block"
