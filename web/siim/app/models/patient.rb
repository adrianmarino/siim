class Patient < ActiveRecord::Base
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def to_s
		"#{self.firstname} #{self.lastname}"
	end

	# -------------------------------------------------------------------------
	# Attributes...
	# -------------------------------------------------------------------------
	attr_accessible :dni, :firstname, :lastname, :birthdate, :blood_type,
		:height, :weight, :sex, :address, :email, :home_phone, :movile_phone,
		:medical_history, :medical_history_id, :contacts, :contacts_attributes,
		:photo, :photo_content_type, :photo_file_size, :photo_file_name, :_destroy

	# -------------------------------------------------------------------------
	# Associations...
	# -------------------------------------------------------------------------
	belongs_to :medical_history, touch: true
	has_many :contacts
	has_attached_file :photo,
	:styles => {:medium => "200x200>", :small => "45x41>"},
	:default_url	=> "/assets/images/photo-:style.png",
	:url					=> "/assets/patients/:id/:style/:basename.:extension",
	:path					=> ":rails_root/public/assets/patients/:id/:style/:basename.:extension"

	# -------------------------------------------------------------------------
	# Nested attributes...
	# -------------------------------------------------------------------------
	accepts_nested_attributes_for :contacts, allow_destroy: true

	# -------------------------------------------------------------------------
	# Validations...
	# -------------------------------------------------------------------------
	validates :dni, :firstname, :lastname, :birthdate, :height, :weight, 
	:address, :home_phone, :movile_phone, presence: true

	validates :dni, length: { minimum: 7 }
	validates :email, presence: true, email: true

	validates_attachment :photo,
		:content_type => { :content_type => ["image/jpg","image/png","image/bmp"] },
		:size => { :in => 0..10.megabytes }
end
