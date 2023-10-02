class CreateEventMemberships < ActiveRecord::Migration[7.0]
  def up
    create_table :event_memberships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.boolean :accepted, null: false, default: false
    end

    add_index :event_memberships, [:user_id, :event_id], unique: true
  end

  def down
    remove_index :event_memberships, column: [:user_id, :event_id]

    drop_table :event_memberships
  end
end
