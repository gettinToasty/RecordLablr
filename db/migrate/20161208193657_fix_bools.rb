class FixBools < ActiveRecord::Migration[5.0]
  def change

    change_column :albums, :live, :string
    change_column :tracks, :bonus, :string
  end
end
