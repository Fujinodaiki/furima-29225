class ItemsController < ApplicationController
  before_action :move_to_sign_up, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @item = Item.includes(:user).order('created_at DESC') # n+1問題の解消
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to new_user_registration_path unless current_user.id == @item.user.id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :comment, :price, :category_id, :status_id, :deliveryfee_id, :areaofdelivery_id, :daysunilshipping_id).merge(user_id: current_user.id)
  end

  def move_to_sign_up
    redirect_to new_user_registration_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
