class CreateAssets < ActiveRecord::Migration[6.0]
  def change
    create_table :assets do |t|
      t.string :type, null: false
      t.string :owner, null: false
      t.string :address
      t.integer :rooms, default: 1, null: false
      t.integer :sqmt, default: 1, null: false
      t.decimal :price, default: 0.0, null: false, precision: 8, scale: 2
      t.jsonb :settings, default: {}, null: false
      t.text :image_data

      t.timestamps
    end
  end
end
