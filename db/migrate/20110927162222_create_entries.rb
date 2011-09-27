class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :user_id
      t.string :name
      t.text :definition

      t.timestamps
    end
  end
end
