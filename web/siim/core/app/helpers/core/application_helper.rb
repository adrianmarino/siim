module Core
	module ApplicationHelper
		# -------------------------------------------------------------------------
		# Public Methods...
		# -------------------------------------------------------------------------
		def variable_name(a_name)
			"@#{a_name}"
		end

		def instance_of(a_name)
			eval(variable_name(@entity_name))
		end

		def translate_attribute(a_class_name, an_attribute_name)
			to_class(to_class_name(a_class_name.to_s)).human_attribute_name an_attribute_name
		end

		def show_entities(a_collection, a_property_name)
			output = ""
			a_collection.each_with_index do |a_entity, an_index|
				if an_index == (a_collection.length - 1)
					separator = "."
				else
					separator = ", "
				end
				output += a_entity.send(a_property_name) + separator
			end
			return output
		end

		def show_messages
			render :partial => 'application/messages'
		end

		# -------------------------------------------------------------------------
		# Private Methods...
		# -------------------------------------------------------------------------
		private
			def capitalize_first(a_value)
				value = String.new(a_value)
				value[0] = value[0].capitalize
				return value
			end

			def to_class_name(a_snake_name)
				a_snake_name.split('_').collect { |a_name| a_name.capitalize }.join
			end

			def to_class(a_class_name)
				capitalize_first(a_class_name.to_s).split('::').inject(Object) do |mod, class_name|
					mod.const_get(class_name)
				end
			end
	end
end
