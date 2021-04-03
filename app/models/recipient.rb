class Recipient < ApplicationRecord
  #アソシエーション
  belongs_to :purchase

  #バリデーション
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "にはハイフンを入れて入力してください" }
    validates :prefecture_id, numericality: { other_than: 1, message: "都道府県を入力してください" }
    validates :city, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'には全角文字を使用してください' }
    validates :address, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'には全角文字を使用してください' }
    validates :phone_number, numericality: { only_integer: true }
  end

end
