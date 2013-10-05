class User < ActiveRecord::Base
  # -------------------------------------------------------------------------
  # Public Methods...
  # -------------------------------------------------------------------------
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
    :birthdate, :is_medical, :photo, :photo_content_type, :photo_file_size,
    :photo_file_name, :_destroy

  attr_accessor :login
  attr_accessor :photo, :_destroy

  
  # -------------------------------------------------------------------------
  # Authorization Attributes...
  # -------------------------------------------------------------------------
  devise :database_authenticatable, :recoverable, :rememberable, :trackable,
   :validatable, :token_authenticatable

  # -------------------------------------------------------------------------
  # Validations...
  # -------------------------------------------------------------------------
  validates :first_name, :last_name,:dni,:email, :presence => true

  # -------------------------------------------------------------------------
  # Associations...
  # -------------------------------------------------------------------------
  has_many :medical
  has_attached_file :photo, :styles => {:medium => "200x200>"}, 
    :default_url => "images/photo.png", :url  => "/assets/patients/:id/:style/:basename.:extension", 
    :path => ":rails_root/public/assets/patients/:id/:style/:basename.:extension"

  # -------------------------------------------------------------------------
  # Nested attributes...
  # -------------------------------------------------------------------------
  accepts_nested_attributes_for :medical, :allow_destroy => true

end
