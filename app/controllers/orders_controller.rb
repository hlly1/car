class OrdersController < ApplicationController
  before_action :login_check, only: [:new]
  before_action :set_vehicle, only: [:new]
  before_action :set_order, only: [:show, :cancel_order, :pay_order]
  
  def index
    #code
  end
  
  def new
    @order = Order.new
  end
  
  def show
  end
  
  def create
    @order = Order.new(order_params)
    if @order.save
      flash[:success] = "Congratulations, your order is made!"
      @order.update!(aasm_state: "awaiting_payment")
      redirect_to @order
    end
  end
  
  def pay_order
    if @order.update(aasm_state: "completed")
      redirect_to order_path(@order)
    end
  end
  
  def cancel_order
    if @order.update(aasm_state: "canceled")
      redirect_to order_path(@order)
    end
  end
  
  private

  def order_params
    params.require(:order).permit(:start, :end, :price, :user_id, :vehicle_id, :location_id)
  end
  
  def set_order
    @order = Order.find(params[:id])
  end
  
  def set_vehicle
    @vehicle = Vehicle.find(params[:vehicle_id])
  end
  
  def login_check
    if !logged_in? 
      redirect_to index_path
      flash[:danger] = "Please login first!"
    end
  end
  
end
