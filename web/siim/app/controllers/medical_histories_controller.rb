class MedicalHistoriesController < ApplicationController
  # GET /medical_histories
  # GET /medical_histories.json
  def index
    @medical_histories = MedicalHistory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medical_histories }
    end
  end

  # GET /medical_histories/1
  # GET /medical_histories/1.json
  def show
    @medical_history = MedicalHistory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medical_history }
    end
  end

  # GET /medical_histories/new
  # GET /medical_histories/new.json
  def new
    @medical_history = MedicalHistory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medical_history }
    end
  end

  # GET /medical_histories/1/edit
  def edit
    @medical_history = MedicalHistory.find(params[:id])
  end

  # POST /medical_histories
  # POST /medical_histories.json
  def create
    @medical_history = MedicalHistory.new(params[:medical_history])

    respond_to do |format|
      if @medical_history.save
        format.html { redirect_to @medical_history, notice: 'Medical history was successfully created.' }
        format.json { render json: @medical_history, status: :created, location: @medical_history }
      else
        format.html { render action: "new" }
        format.json { render json: @medical_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medical_histories/1
  # PUT /medical_histories/1.json
  def update
    @medical_history = MedicalHistory.find(params[:id])

    respond_to do |format|
      if @medical_history.update_attributes(params[:medical_history])
        format.html { redirect_to @medical_history, notice: 'Medical history was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medical_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medical_histories/1
  # DELETE /medical_histories/1.json
  def destroy
    @medical_history = MedicalHistory.find(params[:id])
    @medical_history.destroy

    respond_to do |format|
      format.html { redirect_to medical_histories_url }
      format.json { head :no_content }
    end
  end
end
