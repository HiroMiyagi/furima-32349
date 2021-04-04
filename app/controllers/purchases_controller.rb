class PurchasesController < ApplicationController
  def index
    @purchase_recipient = PurchaseRecipient.new
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase_recipient = PurchaseRecipient.create(purchase_params)
  end

  private
  
  def purchase_params
    params.require(:purchase_recipient).permit(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, buillding: buillding, phone_number: phone_number)
  end
end
