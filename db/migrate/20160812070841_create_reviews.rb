class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :reviewable_type
      t.integer :reviewable_id
      t.text :content
      t.integer :user_id, null: false
      t.string :user_type, null: false

      t.timestamps
    end
  end
end
