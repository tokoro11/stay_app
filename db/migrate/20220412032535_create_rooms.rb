class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :title
      t.text :content
      t.integer :money
      t.text :live

      t.timestamps
    end
  end
end
