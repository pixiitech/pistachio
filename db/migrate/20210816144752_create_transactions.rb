class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.integer :transaction_type, null: false

      t.date :effective_date, null: false
      t.decimal :principal_change, default: 0, null: false, precision: 12, scale: 2
      t.decimal :interest_change, default: 0, null: false, precision: 12, scale: 2
      t.decimal :fees_change, default: 0, null: false, precision: 12, scale: 2
      t.boolean :reversed, default: false
      t.boolean :reversal, default: false
      t.timestamps
    end
  end
end
