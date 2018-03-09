class ChangeValidationsOnBands < ActiveRecord::Migration[5.1]
  def change
    remove_index :bands, :name
    add_index :bands, :name, unique: true
  end
end
