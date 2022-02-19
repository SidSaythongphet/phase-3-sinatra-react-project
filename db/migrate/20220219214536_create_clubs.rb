class CreateClubs < ActiveRecord::Migration[6.1]
  def change
    create_table :clubs do |t|
      t.string :club_title
      t.integer :admin
      t.text :description
      t.timestamps
    end
  end
end
