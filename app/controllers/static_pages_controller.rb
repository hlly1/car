class StaticPagesController < ApplicationController
  before_action :redirect, only: [:home]
  
  def home
  end
  
  def index
  end
  
  
  private
    
    def redirect
      if logged_in? 
        redirect_to index_path
      end
    end
    
end
