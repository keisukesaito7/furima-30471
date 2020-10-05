class OrdersController < ApplicationController
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
end
