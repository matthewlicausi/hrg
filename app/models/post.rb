class Post < ActiveRecord::Base
  attr_accessible :author, :body, :category, :title, :user_id, :image
  
  has_attached_file :image,
  			  :url => "/postimages/get/:id",  
              :path => "postimages/:id/:basename.:extension"
  
  validates_attachment_size :image, :less_than => 10.megabytes
  do_not_validate_attachment_file_type :image
  
  belongs_to :user
end
