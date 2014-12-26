class Post < ActiveRecord::Base

	belongs_to :user
	has_many :likes
	has_attached_file :image, :styles => { :thumb => '75x75#', :large => '300x300#' }, :default_style => :thumb
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
