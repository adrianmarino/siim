class FileHelper
	def self.delete_if_exist(a_path)
		File.delete(a_path) if File.exist?(a_path) 		
	end
end