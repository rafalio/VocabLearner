class AddYesesToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :yes, :integer, default: 0
    add_column :entries, :no, :integer, default: 0
  end
end
