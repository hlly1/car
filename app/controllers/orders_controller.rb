class OrdersController < ApplicationController
  before_action :login_check, only: [:new, :show]
  before_action :set_vehicle, only: [:new]
  before_action :set_order, only: [:show, :cancel_order, :pay_order, :return_car]

  def index
    #code
  end
  
  def new
    @order = Order.new
  end
  
  def show
    if params[:status] == "ok"
      @order.update!(aasm_state: "completed")
      
    end
  end
  
  def create
    @order = Order.new(order_params)
    vehicle_id = params[:order][:vehicle_id]

    if @order.save
      flash[:success] = "Congratulations, your order is made!"
      @order.update!(aasm_state: "pending")
      @order.vehicle.update!(statu: 0)
      redirect_to @order
    else
      redirect_to new_order_path(vehicle_id: vehicle_id), notice: @order.date_validation
    end
  end
  
  def pay_order
    redirect_to @order.paypal_url(order_path(@order))
  end
  
  def cancel_order
    if @order.update(aasm_state: "cancelled")
      @order.vehicle.update!(statu: 1)
      redirect_to order_path(@order)
    end
  end
  
  def return_car
    # puts "---------------------#{@order.location_validation(request.ip)}----------------------------"
    # if @order.location_validation(request.ip)
    if @order.update!(return_car: 1)
        @order.vehicle.update(statu: 1, location: @order.location.address)
        redirect_to order_path(@order), notice: "Return Successfully: Thanks for using!"
    else
      redirect_to order_path(@order), notice: "Return Failed: 404!"
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
