class CrudLayoutSelector
  # -------------------------------------------------------------------------
  # Public Methods...
  # -------------------------------------------------------------------------
  def layout_of(an_action)
    if is_crud_action? an_action
      layout = 'crud/' +  an_action
    else
      layout = 'application'
    end
    log_layout layout
    layout
  end

  # -------------------------------------------------------------------------
  # Private Methods...
  # -------------------------------------------------------------------------
  private
    def is_crud_action?(an_action)
      @crud_actions.include? an_action.to_sym
    end

    def log_layout(a_layout)
      @logger.info "--->> Layout: \"#{a_layout}\" <<---"
    end

    # -------------------------------------------------------------------------
    # Constructor...
    # -------------------------------------------------------------------------
    def initialize(actions, a_logger)
      @crud_actions = actions
      @logger = a_logger
    end
end
