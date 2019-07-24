class AddUserFiles < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :file, :string
  end
end
