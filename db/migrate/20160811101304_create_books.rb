class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :location
      t.string :description

      t.timestamps
    end
  end
end
