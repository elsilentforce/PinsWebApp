class Pin < ActiveRecord::Base
	#do_not_validate_attachment_file_type :image
	has_attached_file :image, styles: {medium: "240x240>"}
	validates_attachment :image, presence: true,
						content_type: {content_type: ["image/jpeg","image/jpg","image/png","image/gif"]},
						size: {less_than: 5.megabytes}
	validates :description, presence: true
	attr_accessible :user_id, :description, :image, :image_remote_url
	belongs_to :user

	def image_remote_url=(url_value)
		self.image = URI.parse(url_value) unless url_value.blank?
		super
	end
	
end