class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :brand
      t.decimal :amount
      t.date :expiration
      t.text :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
