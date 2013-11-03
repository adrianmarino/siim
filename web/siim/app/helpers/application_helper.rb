module ApplicationHelper
	include Core::ApplicationHelper
	include Core::NavigationHelper
	include Core::CrudFormHelper
	include Core::CrudPathHelper
	include Core::CrudTranslationHelper
	include Core::PhotoHelper

	def javascript(*files)
		content_for(:head) { javascript_include_tag(*files) }
	end

	def stylesheet(*files)
		content_for(:head) { stylesheet_link_tag(*files) }
	end

	def search_engine_username_and_password_url
		"#{APP_CONFIG.search_engine_username}:#{APP_CONFIG.search_engine_password}@"
	end
end
