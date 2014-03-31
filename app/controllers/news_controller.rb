class NewsController < ApplicationController

	def index
	  
	  # for category and author filtering
	  if params[:category]
	  	@posts = Post.where(:category => params[:category]).paginate(:page => params[:page], :per_page => 4).order("created_at DESC")
	  elsif params[:author]
	    @posts = Post.where(:author => params[:author]).paginate(:page => params[:page], :per_page => 4).order("created_at DESC")
	  else
	    @posts = Post.paginate(:page => params[:page], :per_page => 4).order("created_at DESC")
	  end
	  
	  
	end
	
	
	def article
	
	end
	
end