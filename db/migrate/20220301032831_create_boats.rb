class CreateBoats < ActiveRecord::Migration[6.1]
  def change
    create_table :boats do |t|
      t.string :title
      t.text :description
      t.string :boat_type
      t.float :price
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
