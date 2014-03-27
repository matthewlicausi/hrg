class Post < ActiveRecord::Base
  attr_accessible :author, :body, :category, :title, :user_id
  
  belongs_to :user
end
