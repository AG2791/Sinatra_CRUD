class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title   #change this to description
      t.text :content    # 
      t.integer :user_id #foreign key
    end
  end
end
