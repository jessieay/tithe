class AddIndexToTransaction < ActiveRecord::Migration
  def change
    add_index :transactions, :user_id
    add_index :transactions, :organization_id
  end
end
