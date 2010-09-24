# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  def play
        
    chains_in_play = []
    
    Chain.all.each do |chain|
      
      if chain.posts.length <= 11
        
        chains_in_play << chain
      
      end
      
    end
    
    @chain = chains_in_play[rand(chains_in_play.length)]
    
    redirect_to :controller => 'posts', :action => 'new', :chain => @chain
        
  end
  
  def about
    
  end

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
