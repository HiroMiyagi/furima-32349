class CreateRecipients < ActiveRecord::Migration[6.0]
  def change
    create_table :recipients do |t|
      t.string     :postal_code,   null: false
      t.integer    :prefecture_id, null: false
      t.string     :city,          null: false
      t.string     :address,       null: false
      t.string     :buillding
      t.string     :phone_number,  null: false
      t.references :purchase,      foreign_key: true
      t.timestamps
    end
  end
end

