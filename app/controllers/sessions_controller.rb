class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Login successfully!"
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email or passwords!'
      render 'new'
    end
  end
  
  def destroy
    log_out
    flash[:success] = "You have logged out!"
    redirect_to root_url
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
end
