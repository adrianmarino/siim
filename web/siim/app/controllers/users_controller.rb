class UsersController < CrudController
	load_and_authorize_resource
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	# GET /users
	# GET /users.json
	def index
		@users = User.all
		hide_view_action
		setup_remove_confirm_message 'users.confirm_delete'
		setup_index_title 'users.index.title'

		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @users }
		end
	end

	# GET /users/1
	# GET /users/1.json
	def show
		@user = User.find params[:id]
		@medical = @user.medical

		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @user }
		end
	end

	# GET /users/new
	# GET /users/new.json
	def new
		@user = User.new
		@user.medical= Medical.new
		@medical_specializations = medical_specializations
		@roles = Role.all
		@medical_role = medical_role
		@has_medical_role = false
		@user.setup_password

		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @user }
		end
	end

	# POST /users
	# POST /users.json
	def create
		@user = User.new params[:user]
		@medical_specializations = medical_specializations
		@roles = Role.all
		@medical_role = Role.find_by_name :medical
		@has_medical_role = @user.is_medical?

		if @has_medical_role
			@user.medical.firstname = @user.first_name
			@user.medical.lastname = @user.last_name
			@user.medical.dni = @user.dni
			@user.medical.email = @user.email
			@user.medical.home_phone = @user.home_phone
			@user.medical.movile_phone = @user.movile_phone
		end

		respond_to do |format|
			if @user.save
				@user.medical = nil unless @has_medical_role
				format.html { redirect_to users_path, notice: CrudTranslations.model_was_created(@user) }
				format.json { render json: @user, status: :created, location: @user }
				Thread.new do
					@user.inscription_at_system_mailer
				end
			else
				format.html { render action: "new" }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	# GET /users/1/edit
	def edit
		@user = User.find params[:id]
		@user.medical ||= Medical.new
		@medical_specializations = medical_specializations
		@roles = Role.all
		@medical_role = Role.find_by_name :medical
		@has_medical_role = @user.is_medical?
	end

	# PUT /users/1
	# PUT /users/1.json
	def update
		@user = User.find params[:id]
		@medical = @user.medical
		@medical_specializations = medical_specializations
		@roles = Role.all
		@medical_role = Role.find_by_name :medical
		@has_medical_role = params[:user][:role_ids].include? @medical_role.id.to_s

		if @has_medical_role
			@medical.firstname = @user.first_name
			@medical.lastname = @user.last_name
			@medical.dni = @user.dni
			@medical.email = @user.email
			@medical.home_phone = @user.home_phone
			@medical.movile_phone = @user.movile_phone
		end

		if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
				params[:user].delete(:password)
				params[:user].delete(:password_confirmation)
		end

		respond_to do |format|
			if @user.update_attributes(params[:user])
				@user.medical = nil unless @has_medical_role
				format.html { redirect_to users_path, notice: CrudTranslations.model_was_updated(@user) }
				format.json { head :no_content }
			else
				format.html { render action: "edit" }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /users/1
	# DELETE /users/1.json
	def destroy
		@user = User.find params[:id]
		@user.destroy

		respond_to do |format|
			format.html { redirect_to users_url }
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

	def medical_role
		Role.find_by_name :medical
	end

	# -------------------------------------------------------------------------
	# Constructor...
	# -------------------------------------------------------------------------
	def initialize
		super
		setup_entity_name 'user'
	end
end

