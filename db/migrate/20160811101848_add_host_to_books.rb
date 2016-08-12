class AddHostToBooks < ActiveRecord::Migration[5.0]
  def change
    add_reference :books, :host, foreign_key: true
  end
end
