class MedicalSpecializationsController < CrudController
  # GET /medical_specializations
  # GET /medical_specializations.json
  def index
    @medical_specializations = MedicalSpecialization.all
    hide_view_action
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medical_specializations }
    end
  end

  # GET /medical_specializations/1
  # GET /medical_specializations/1.json
  def show
    @medical_specialization = MedicalSpecialization.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medical_specialization }
    end
  end

  # GET /medical_specializations/new
  # GET /medical_specializations/new.json
  def new
    @medical_specialization = MedicalSpecialization.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medical_specialization }
    end
  end

  # GET /medical_specializations/1/edit
  def edit
    @medical_specialization = MedicalSpecialization.find(params[:id])
  end

  # POST /medical_specializations
  # POST /medical_specializations.json
  def create
    @medical_specialization = MedicalSpecialization.new(params[:medical_specialization])

    respond_to do |format|
      if @medical_specialization.save
        format.html { redirect_to medical_specializations_path, notice: CrudTranslations.model_was_created(@medical_specialization) }
        format.json { render json: @medical_specialization, status: :created, location: @medical_specialization }
      else
        format.html { render action: "new" }
        format.json { render json: @medical_specialization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medical_specializations/1
  # PUT /medical_specializations/1.json
  def update
    @medical_specialization = MedicalSpecialization.find(params[:id])

    respond_to do |format|
      if @medical_specialization.update_attributes(params[:medical_specialization])
        format.html { redirect_to medical_specializations_path, notice: CrudTranslations.model_was_updated(@medical_specialization) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medical_specialization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medical_specializations/1
  # DELETE /medical_specializations/1.json
  def destroy
    @medical_specialization = MedicalSpecialization.find(params[:id])
    @medical_specialization.destroy

    respond_to do |format|
      format.html { redirect_to medical_specializations_url }
      format.json { head :no_content }
    end
  end

  # -------------------------------------------------------------------------
  # Constructor...
  # -------------------------------------------------------------------------
  def initialize
    super
    setup_entity_name 'medical_specialization'
  end
end
