class NewsController < ApplicationController

	def index
	  
	  # for category and author filtering
	  if params[:category]
	  	@posts = Post.where(:category => params[:category]).order("created_at DESC")
	  elsif params[:author]
	    @posts = Post.where(:author => params[:author]).order("created_at DESC")
	  else
	    @posts = Post.order("created_at DESC")
	  end
	  
	  
	end
	
	
	def article
	
	end
	
end