class AddDateTimeToBook < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :start_at, :datetime
    add_column :books, :end_at, :datetime
  end
end
