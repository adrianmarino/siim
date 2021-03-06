class User < ActiveRecord::Base
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def has_role?(a_role_sym)
		roles.any? { |a_role| a_role.name.underscore.to_sym == a_role_sym }
	end

	def to_s
		"#{first_name} #{last_name}"
	end

	def self.find_first_by_auth_conditions(warden_conditions)
		conditions = warden_conditions.dup
		if login = conditions.delete(:login)
			where(conditions).where(["lower(dni) = :value OR lower(email) = :value", { :value => login.downcase }]).first
		else
			where(conditions).first
		end
	end

	def is_medical?
		self.has_role? :medical
	end

	def setup_password
		self.password = PasswordGenerator.password(8)
	end

	# -------------------------------------------------------------------------
	# Private Methods
	# -------------------------------------------------------------------------
	def inscription_at_system_mailer
		UserMailer.inscription_at_system_mailer(self).deliver
	end

	# -------------------------------------------------------------------------
	# Attributes...
	# -------------------------------------------------------------------------
	attr_accessible :login, :first_name, :last_name, :dni, :email, :password,
		:password_confirmation, :remember_me, :authentication_token,
		:sex, :address, :home_phone, :movile_phone, :medical_attributes, :medical,
		:photo, :photo_content_type, :photo_file_size, :photo_file_name,
		:_destroy, :birthdate, :role_ids, :roles

	attr_accessor :login, :_destroy

	# -------------------------------------------------------------------------
	# Authorization Attributes...
	# -------------------------------------------------------------------------
	devise :database_authenticatable, :recoverable, :rememberable, :trackable,
	 :validatable, :token_authenticatable, :registerable

	# -------------------------------------------------------------------------
	# Associations...
	# -------------------------------------------------------------------------
	has_one :medical, :dependent => :destroy
	has_many :assignments
	has_many :roles, :through => :assignments
	has_attached_file :photo,
	:styles => {:medium => "200x200>", :small => "45x41>"},
	:default_url	=> "/assets/images/photo-:style.png",
	:url					=> "/assets/users/:id/:style/:basename.:extension",
	:path					=> ":rails_root/public/assets/users/:id/:style/:basename.:extension"

	# -------------------------------------------------------------------------
	# Nested attributes...
	# -------------------------------------------------------------------------
	accepts_nested_attributes_for :medical, :allow_destroy => true

	# -------------------------------------------------------------------------
	# Validations...
	# -------------------------------------------------------------------------
	validates :dni, length: { minimum: 7, maximum: 10 }, :uniqueness => true, :presence => true, :numericality => true
	validates :home_phone, :movile_phone, length: { maximum: 20 }
	validates :home_phone, :movile_phone, :numericality => true, allow_blank: true
	validates :first_name, :last_name, length: { maximum: 30 }, :presence => true
	validates :address, length: { maximum: 100 }
	validates :email, :presence => true, :email => true
	validates_presence_of :roles
	validates_attachment :photo,
		:content_type => { :content_type => ["image/jpg","image/png","image/bmp"] },
		:size => { :in => 0..10.megabytes }
end
