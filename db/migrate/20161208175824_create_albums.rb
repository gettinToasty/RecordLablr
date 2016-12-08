class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|

      t.boolean :live, null: false
      t.string :title, null: false
      t.integer :band_id, null: false

      t.timestamps
    end

    add_index :albums, :band_id
  end
end
