class AddScoreToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :score, :decimal, :default => 1, :null => false
  end
end
