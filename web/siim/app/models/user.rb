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
  # Attributes...
  # -------------------------------------------------------------------------
  attr_accessible :login, :first_name, :last_name, :dni, :email, :password,
    :password_confirmation, :remember_me

  attr_accessor :login

  # -------------------------------------------------------------------------
  # Authorization Attributes...
  # -------------------------------------------------------------------------
  devise :database_authenticatable, :registerable, :recoverable,
    :rememberable, :trackable, :validatable, :confirmable

  # -------------------------------------------------------------------------
  # Validations...
  # -------------------------------------------------------------------------
  validates :first_name, :last_name,:dni,:email, :presence => true
end
