require 'rails_helper'

RSpec.describe PurchaseRecipient, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @purchase_recipient = FactoryBot.build(:purchase_recipient)
    @purchase_recipient.user_id = @user.id
    @purchase_recipient.item_id = @item.id
    sleep 0.1
  end
  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it 'user,item,postal_code,prefecture_id,city,address,buillding,phone_number,purchaseが存在すれば購入できる' do
        expect(@purchase_recipient).to be_valid
      end
      it 'postal_codeにハイフンが含まれれば購入できる' do
        @purchase_recipient.postal_code = "111-1111"
        expect(@purchase_recipient).to be_valid
      end
      it 'phone_numberが11桁以内であれば購入できる' do
        @purchase_recipient.phone_number = 19112345678
        expect(@purchase_recipient).to be_valid
      end
      it 'builldingがなくても購入できる' do
        @purchase_recipient.buillding = ""
        expect(@purchase_recipient).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'userが存在しないと購入できない' do
        @purchase_recipient.user_id = nil
        @purchase_recipient.valid?
        expect(@purchase_recipient.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが存在しないと購入できない' do
        @purchase_recipient.item_id = nil
        @purchase_recipient.valid?
        expect(@purchase_recipient.errors.full_messages).to include("Item can't be blank")
      end
      it 'postal_codeが存在しないと購入できない' do
        @purchase_recipient.postal_code = ""
        @purchase_recipient.valid?
        expect(@purchase_recipient.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンが入っていないと購入できない' do
        @purchase_recipient.postal_code = "1111111"
        @purchase_recipient.valid?
        expect(@purchase_recipient.errors.full_messages).to include("Postal code にはハイフンを入れて入力してください")
      end
      it 'prefecture_idが存在しないと購入できない' do
        @purchase_recipient.prefecture_id = ""
        @purchase_recipient.valid?
        expect(@purchase_recipient.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが1だと購入できない' do
        @purchase_recipient.prefecture_id = 1
        @purchase_recipient.valid?
        expect(@purchase_recipient.errors.full_messages).to include("Prefecture 都道府県を入力してください")
      end
      it 'cityが存在しないと購入できない' do
        @purchase_recipient.city = ""
        @purchase_recipient.valid?
        expect(@purchase_recipient.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが存在しないと購入できない' do
        @purchase_recipient.address = ""
        @purchase_recipient.valid?
        expect(@purchase_recipient.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが存在しないと購入できない' do
        @purchase_recipient.phone_number = ""
        @purchase_recipient.valid?
        expect(@purchase_recipient.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが全角文字だと購入できない' do
        @purchase_recipient.phone_number = "０９０１１１１１１１１"
        @purchase_recipient.valid?
        expect(@purchase_recipient.errors.full_messages).to include("Phone number is not a number")
      end
      it 'phone_numberが12桁以上だと購入できない' do
        @purchase_recipient.phone_number = "090123456789"
        @purchase_recipient.valid?
        expect(@purchase_recipient.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
    end
  end
end
