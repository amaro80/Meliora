class CreateWines < ActiveRecord::Migration[5.0]
  def change
    create_table :wines do |t|
      t.string :name
      t.string :type_wine
      t.string :image_url
      t.string :country
      t.integer :wine_year
      t.string :upc, :limit => 25
      t.integer :rating
      t.integer :vineyard_id
      t.integer :user_id
      t.references :user, foreign_key: true
      t.references :vineyard, foreign_key: true

      t.timestamps
    end
  end
end
