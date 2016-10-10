class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.boolean :is_admin, default: false
      t.string :provider
      t.string :uid

      t.timestamps null: false
    end
    add_index :users, unique: true
  end
end
