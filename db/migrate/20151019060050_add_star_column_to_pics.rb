class AddStarColumnToPics < ActiveRecord::Migration
  def change
    add_column :pics, :starred, :boolean
  end
end
