class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :redirect_to_root_path, only: :new

  def new
    @item = Item.find(params[:item_id])
    @order = ItemOrder.new
  end

  def create
    @order = ItemOrder.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def order_params
    params.require(:item_order).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def redirect_to_root_path
    item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == item.user.id
  end
end
