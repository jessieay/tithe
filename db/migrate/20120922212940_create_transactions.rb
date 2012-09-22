class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :stripe_customer_token
      t.decimal :amount
      t.integer :user_id
      t.integer :organization_id

      t.timestamps
    end
  end
end
