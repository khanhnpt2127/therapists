class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :reviewable_type
      t.integer :reviewable_id
      t.text :content
      t.integer :user_id
      t.integer :host_id

      t.timestamps
    end
  end
end
