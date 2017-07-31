class CreateVineyards < ActiveRecord::Migration[5.0]
  def change
    create_table :vineyards do |t|
      t.string :name
      t.string :type_vineyard
      t.string :image_url
      t.integer :user_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
