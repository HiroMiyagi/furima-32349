class PurchasesController < ApplicationController
  def index
    @purchase_recipient = PurchaseRecipient.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
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
    params.require(:purchase_recipient).permit(:postal_code, :prefecture_id, :city, :address, :buillding, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], price: @item.price, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: purchase_params[:price],
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
