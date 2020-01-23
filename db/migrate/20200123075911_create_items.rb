class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.text :description
      t.integer :without_tax_price
      t.boolean :sale_status
      t.string :item_image_id
      t.timestamps
    end
  end
end
