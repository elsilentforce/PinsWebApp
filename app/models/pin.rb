class Pin < ActiveRecord::Base
	#do_not_validate_attachment_file_type :image
	has_attached_file :image, styles: {medium: "240x240>"}
	validates_attachment :image, presence: true,
						content_type: {content_type: ["image/jpeg","image/jpg","image/png","image/gif"]},
						size: {less_than: 5.megabytes}
	validates :description, presence: true
	attr_accessible :user_id, :description, :image
	belongs_to :user
	
end
