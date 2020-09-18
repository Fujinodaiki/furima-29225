class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_root

  def index
    @item = Item.find(params[:item_id])
    @itemshipping = ItemShipping.new
  end

  def create
    @itemshipping = ItemShipping.new(order_params)
    if @itemshipping.valid?
      pay_item
      @itemshipping.save
      return redirect_to root_path
    else
      render 'index'
    end
  end


  private

  def order_params
    params.require(:item_shipping).permit(:postalcode,:municipalities,:areaofdelivery_id,:address,:buildingname,:phonenumber).merge( user_id: current_user.id,token:params[:token],item_id:params[:item_id])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def move_to_root
    @item = Item.find(params[:item_id])
    if  current_user.id == @item.user_id || @item.order.present? 
      redirect_to root_path
    end
  end

end
