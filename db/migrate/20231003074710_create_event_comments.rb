class CreateEventComments < ActiveRecord::Migration[7.0]
  def change
    create_table :event_comments do |t|
      t.string :body, null: false
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.references :event, null: false, foreign_key: true

      t.datetime :created_at, null: false
    end
  end
end
