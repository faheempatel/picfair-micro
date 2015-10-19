class CreatePics < ActiveRecord::Migration
  def change
    create_table :pics do |t|
      t.string :name
      t.text :description
      t.string :url

      t.timestamps null: false
    end
  end
end
