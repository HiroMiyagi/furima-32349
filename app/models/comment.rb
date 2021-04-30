class Comment < ApplicationRecord
  # アソシエーション
  belongs_to :user
  belongs_to :item

  # バリデーション
  with_options presence: true do
    validates :text
  end
end
