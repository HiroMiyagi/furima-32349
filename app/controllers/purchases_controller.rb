class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @purchase_recipient = PurchaseRecipient.new
  end

  def create
    @purchase_recipient = PurchaseRecipient.new(purchase_params)
    if @purchase_recipient.valid?
      pay_item
      @purchase_recipient.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  
  def purchase_params
    params.require(:purchase_recipient).permit(:postal_code, :prefecture_id, :city, :address, :buillding, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    return redirect_to root_path if current_user.id == @item.user.id
  end
end
