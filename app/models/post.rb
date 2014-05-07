class Post < ActiveRecord::Base
  attr_accessible :author, :body, :category, :title, :user_id, :image
  
has_attached_file :image,
    :storage => :s3,
    :bucket => 'HRG',
    :s3_credentials => {
      :access_key_id => 'AKIAJ2YH5SECIDX46MPA',
      :secret_access_key => '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'
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

