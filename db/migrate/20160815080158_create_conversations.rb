class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.integer :sender_id, null: false
      t.string :sender_type, null: false
      t.integer :recipient_id, null: false
      t.string :recipient_type, null: false
      t.timestamps
    end
  end
end
