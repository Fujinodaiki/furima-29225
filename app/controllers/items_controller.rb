class ItemsController < ApplicationController
 before_action :move_to_sign_up, except: [:index,]

  def index
  end

  def new
    @item =Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


 private 
  def item_params
    params.require(:item).permit(:name,:image,:comment,:price,:category_id,:status_id,:deliveryfee_id,:areaofdelivery_id,:daysunilshipping_id).merge(user_id: current_user.id)
  end


  def move_to_sign_up
    unless user_signed_in?
      redirect_to "/users/sign_in"
    end
  end
end
