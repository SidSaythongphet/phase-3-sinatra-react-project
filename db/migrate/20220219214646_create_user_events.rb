class CreateUserEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :event_title
      t.integer :club_id
      t.datetime :event_date
      t.timestamps
    end
  end
end
