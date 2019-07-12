class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :menu_id
      t.string :name
      t.integer :price
      t.string :desc

      t.timestamps
    end
  end
end
