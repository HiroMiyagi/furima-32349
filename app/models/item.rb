class Item < ApplicationRecord
  ### アソシエーション
  belongs_to :user

  ### バリデーション
  with_options presence: true do
    validates :name
    validates :info
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id 
    validates :prefecture_id
    validates :scheduled_delivery_id
    validates :price
  end

end
