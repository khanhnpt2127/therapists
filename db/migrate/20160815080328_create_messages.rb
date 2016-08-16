class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.references :conversation, index: true, null: false
      t.integer :user_id, null: false
      t.string :user_type, null: false
      t.datetime :read_at

      t.timestamps
    end

    add_index :messages, [:user_id, :user_type]
  end
end
