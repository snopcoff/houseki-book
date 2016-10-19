class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :description
      t.integer :pages
      t.string :author
      t.date :publish_time
      t.references :category, index: true, foreign_key: true

      t.timestamps
    end
  end
end
