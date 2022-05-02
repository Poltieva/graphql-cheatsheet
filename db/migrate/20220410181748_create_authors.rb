class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :yob
      t.boolean :is_alive

      t.timestamps
    end
  end
end
