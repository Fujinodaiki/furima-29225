class OrdersController < ApplicationController
  def index
    @itemshipping = ItemShipping.new
    @item = Item.find(params[:item_id])
  end

  # def new
  #   @itemshipping = ItemSgipping.new
  # end

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

end
