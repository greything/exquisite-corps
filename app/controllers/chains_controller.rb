class ChainsController < ApplicationController
  
  def index
    @chains = Chain.all
    
    respond_to do |format|
      
      format.html
      
    end 
  end

  def show
    
    @chain = Chain.find(params[:id])
    
  end

  def new
    @chain = Chain.new
  end

  def edit
    @chain = Chain.find(params[:id])
  end

  def create
     @chain = Chain.new(params[:chain])

     respond_to do |format|
       if @chain.save
         @post = Post.new({:text => @chain.title, :chain_id => @chain.id})
         if @post.save
           flash[:notice] = "Congrats you've started a new chain... copy down this URL and check back to see what people do with it!"
           format.html { redirect_to(@chain) }
         else
         end
       else
         format.html { render :action => "new" }
       end
     end
  end
  
  def destroy
     @chain = Chain.find(params[:id])
     
     @chain.posts.each do |post|
       post.destroy
     end
     
     @chain.destroy

     respond_to do |format|
       format.html { redirect_to(chains_url) }
       format.xml  { head :ok }
     end
   end

end
