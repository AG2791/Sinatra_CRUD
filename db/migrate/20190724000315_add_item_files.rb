class AddItemFiles < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :file, :string
  end
end
