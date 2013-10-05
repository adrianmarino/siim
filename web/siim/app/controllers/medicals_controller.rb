class MedicalsController < CrudController
  # GET /medicals
  # GET /medicals.json
  def index
    @medicals = Medical.all
    hide_view_action
    hide_remove_action

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medicals }
    end
  end

  # GET /medicals/1
  # GET /medicals/1.json
  def show
    @medical = Medical.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medical }
    end
  end

  # GET /medicals/new
  # GET /medicals/new.json
  def new
    @medical = Medical.new
    @medical_specializations = medical_specializations

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medical }
    end
  end

  # GET /medicals/1/edit
  def edit
    @medical = Medical.find(params[:id])
    @medical_specializations = medical_specializations
  end

  # POST /medicals
  # POST /medicals.json
  def create
    @medical = Medical.new(params[:medical])
    @medical_specializations = medical_specializations

    respond_to do |format|
      if @medical.save
        format.html { redirect_to medicals_path, notice: CrudTranslations.model_was_created(@medical) }
        format.json { render json: @medical, status: :created, location: @medical }
      else
        format.html { render action: "new" }
        format.json { render json: @medical.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medicals/1
  # PUT /medicals/1.json
  def update
    @medical = Medical.find(params[:id])
    @medical_specializations = medical_specializations

    respond_to do |format|
      if @medical.update_attributes(params[:medical])
        format.html { redirect_to medicals_path, notice: CrudTranslations.model_was_updated(@medical) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medical.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medicals/1
  # DELETE /medicals/1.json
  def destroy
    @medical = Medical.find(params[:id])
    @medical.destroy

    respond_to do |format|
      format.html { redirect_to medicals_url }
      format.json { head :no_content }
    end
  end


  # -------------------------------------------------------------------------
  # Private Methods...
  # -------------------------------------------------------------------------
  private
    def medical_specializations
      MedicalSpecialization.all.sort
    end

    # -------------------------------------------------------------------------
    # Constructor...
    # -------------------------------------------------------------------------
    def initialize
      super
      setup_entity_name 'medical'
    end
end
