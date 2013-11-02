module Core
	module CrudTranslationHelper
		# -------------------------------------------------------------------------
		# Public Methods...
		# -------------------------------------------------------------------------
		def index_title
			@index_title.nil? ? t("title.#{@entity_name}.list") : t(@index_title)
		end
	end
end