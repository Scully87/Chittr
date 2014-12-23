class Post < ActiveRecord::Base
	
	has_many :likes

	has_attached_file :image, :styles => { :medium => "200x200>", :thumb => "75x75>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
