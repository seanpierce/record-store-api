class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :artist
      t.string :title
      t.decimal :cost

      t.timestamps
    end
  end
end
