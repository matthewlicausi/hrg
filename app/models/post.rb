class Post < ActiveRecord::Base
  attr_accessible :author, :body, :category, :title, :user_id, :image
  
  has_attached_file :image,
  			  :url => "/assets/get/:id",  
              :path => "assets/:id/:basename.:extension"
  
  validates_attachment_size :uploaded_file, :less_than => 10.megabytes
  do_not_validate_attachment_file_type :uploaded_file
  
  belongs_to :user
end
