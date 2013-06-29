
class CrudLayoutCollectionBuilder
  def initialize
    @actions = []
  end

  def with_create
    @actions << :create
    self
  end

  def with_edit
    @actions << :edit
    self
  end

  def with_index
    @actions << :index
    self
  end

  def with_new
    @actions << :new
    self
  end

  def with_show
    @actions << :show
    self
  end

  def with_update
    @actions << :update
    self
  end

  def with_all
    self.with_create.with_edit.with_index.with_new.with_show.with_update
  end

  def build
    @actions
  end
end
