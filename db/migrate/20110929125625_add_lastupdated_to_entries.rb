class AddLastupdatedToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :lastupdated, :date
  end
end
