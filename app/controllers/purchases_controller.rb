class PurchasesController < ApplicationController
  def index
    @purchase_recipient = PurchaseRecipient.new
    @item = Item.find(params[:item_id])
  end

  def create
    binding.pry
    @purchase_recipient = PurchaseRecipient.new(purchase_params)
    if @purchase_recipient.valid?
      @purchase_recipient.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  
  def purchase_params
    params.require(:purchase_recipient).permit(:postal_code, :prefecture_id, :city, :address, :buillding, :phone_number)
  end
end
