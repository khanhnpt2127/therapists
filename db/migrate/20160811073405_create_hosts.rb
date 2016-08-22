class CreateHosts < ActiveRecord::Migration[5.0]
  def change
    create_table :hosts do |t|
      t.string :name
      t.string :password_digest
      t.string :email
      t.string :description
      t.string :phone_number
      t.string :document
      t.string :img_link
      t.boolean :is_super, default: false

      t.timestamps
    end
  end
end
