class Post < ActiveRecord::Base
  attr_accessible :author, :body, :category, :title, :user_id, :image
  
has_attached_file :image,
    :storage => :s3,
    :bucket => ENV['S3_BUCKET_NAME'],
    :s3_credentials => {
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }
  
  validates_attachment_size :image, :less_than => 10.megabytes
  do_not_validate_attachment_file_type :image
  
  belongs_to :user
  
  validates :author, :presence => true
  validates :title, :presence => true
  validates :category, :presence => true
  validates :body, :presence => true
  
  
  def slug
    slug = title.downcase.gsub(/[\*?{}. ]/, "-")
    slug.gsub(/-+$/, '')
  end  

end

