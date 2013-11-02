module Core
	module CrudPathHelper
		def list_path
			eval("#{@plural_entity_name}_path")
		end

		def create_path
			eval("new_#{@entity_name}_path")
		end

		def edit_path(an_entity)
			eval("edit_#{@entity_name}_path(an_entity)")
		end
	end
end