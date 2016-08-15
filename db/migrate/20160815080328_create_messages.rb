class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.references :conversation, index: true
      t.references :user, index: true
      t.datetime :read_at
      t.references :host, index: true

      t.timestamps
    end
  end
end
