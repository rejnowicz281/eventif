class CreateEventMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :event_memberships do |t|
      t.references :member, null: false, foreign_key: { to_table: :users }
      t.references :event, null: false, foreign_key: true

      t.datetime :created_at, null: false
    end
  end
end
