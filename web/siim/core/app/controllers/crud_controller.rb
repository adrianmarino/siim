class CrudController < ApplicationController
	layout :layout_selector
	# -------------------------------------------------------------------------
	# Protected Methods...
	# -------------------------------------------------------------------------
	protected
		def setup_entity_name(an_entity_name)
			@entity_name = an_entity_name
			@plural_entity_name = @entity_name +'s'
		end

		def hide_create_action
			@hide_create_action = true
		end

		def hide_view_action
			@hide_view_action = true
		end

		def hide_edit_action
			@hide_edit_action = true
		end

		def hide_remove_action
			@hide_remove_action = true
		end

		def layout_selector
			new_layout_selector.layout_of requested_action
		end

		def new_layout_selector
			CrudLayoutSelector.new(crud_layouts, logger)
		end

		def hide_remove_action
			@hide_remove_action = true
		end

		def crud_layouts
			CrudLayoutCollectionBuilder.new.with_all.build
		end

		def setup_remove_confirm_message(a_key)
			@confirm_delete =t(a_key)
		end

		def setup_index_title(a_key)
			@index_title = t a_key
		end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
		def requested_action
			params[:action]
		end

	# -------------------------------------------------------------------------
	# Initialize...
	# -------------------------------------------------------------------------
		def initialize
			super
			setup_remove_confirm_message :confirm
		end
end
