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
	  
	  @post_exists = nil
	  
	  
	end
	
	
	def show
      @post = Post.find(params[:id])
	  
	  @post_exists = true


      @current_url = url_for :only_path=>false,:overwrite_params=>{}


	  respond_to do |format|
	    format.html # show.html.erb
	    format.json { render json: @post }
	  end
    end
    
    def get  
	post = Post.find_by_id(params[:id])  
	if post  
		 send_file post.image.path, :type => post.image_content_type  
	end  
  end
	
end