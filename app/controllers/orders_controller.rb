class OrdersController < ApplicationController
  
  
  def new
    @order = Order.new
  end
  
  def create
      @order = Order.new(user_params)
      if @order.save
        flash[:success] = "Congratulations, your order is made!"
        redirect_to @user
      else
        render 'new'
      end

  end
  
  
  private

  def order_params
    params.require(:order).permit(:start, :end, :user, :vhicle, :location)
  end
  
  
end
