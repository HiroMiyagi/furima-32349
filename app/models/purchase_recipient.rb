class PurchaseRecipient
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :buillding, :phone_number, :purchase
  attr_accessor :price, :token

  #バリデーション
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "にはハイフンを入れて入力してください" }
    validates :prefecture_id, numericality: { other_than: 1, message: "都道府県を入力してください" }
    validates :city, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'には全角文字を使用してください' }
    validates :address
    validates :phone_number, numericality: { only_integer: true }, length: { in: 1..11 }
    validates :token
    validates :price
    validates :user_id
    validates :item_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Recipient.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, buillding: buillding, phone_number: phone_number, purchase_id: purchase.id)
  end
end
