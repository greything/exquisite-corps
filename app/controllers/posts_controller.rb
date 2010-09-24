class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
    @chain = Chain.find(params[:chain])
  end

  def edit
  end
  
  def flag
    
    @post = Post.find(params[:id])
    
    flagged = 0
    
    if !@post.flagged
      
      flagged = 1
      
    else 
      
      flagged = @post.flagged + 1
      
    end 
    
    respond_to do |format|
      if @post.update_attributes( :flagged => flagged )
        flash[:notice] = "Oooh sorry about that! That post has been flagged and we'll check it out! Try another!"
        format.html { redirect_to( :controller => 'application', :action => 'play') }
      else
      end
    end
        
  end

  def create
    
    @post = Post.new(params[:post])
    @chain = @post.chain
    
    if @post.previous_post == @chain.posts.last.id
      
      respond_to do |format|
        if @post.save
          flash[:notice] = "Thanks for posting. Here you can see what led up to your post. Copy down this URL and check back to see what others do with your posts. Cheers."
          format.html { redirect_to(@post.chain) }
        else
          format.html { render :action => "new" }
        end
      end
      
    else
      respond_to do |format|
        flash[:notice] = 'Whoops someone beat you to it! Respond to this one:'
        format.html { redirect_to(:controller=>'application', :action =>'play') }
      end
    end
    
  end

  def update
  end

  def destroy
     @post = Post.find(params[:id])
     @post.destroy

     respond_to do |format|
       format.html { redirect_to(posts_path) }
       format.xml  { head :ok }
     end
   end
   


end
