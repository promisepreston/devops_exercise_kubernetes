class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :myFavouriteItem

      t.timestamps
    end
  end
end
