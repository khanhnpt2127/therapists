class AddHostIdToConversations < ActiveRecord::Migration[5.0]
  def change
    add_column :conversations, :host_id, :integer
  end
end
