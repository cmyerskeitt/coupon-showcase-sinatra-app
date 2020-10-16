class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email 
      t.string :password_digest 
      t.string :name 
      t.string :image_url 
      t.string :savings_goal

      t.timestamps null: false
    end 
  end
end
