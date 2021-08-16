class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.integer :account_number, null: false
      t.string :first_name
      t.string :last_name
      t.date :start_date
      t.decimal :financed_amount, default: 0, null: false, precision: 12, scale: 2
      t.decimal :payment_amount, default: 0, null: false, precision: 12, scale: 2
      t.decimal :interest_rate, default: 0, null: false, precision: 12, scale: 2
      t.integer :term, default: 0, null: false
      t.decimal :principal_balance, default: 0, null: false, precision: 12, scale: 2
      t.decimal :interest_balance, default: 0, null: false, precision: 12, scale: 2
      t.decimal :fees_balance, default: 0, null: false, precision: 12, scale: 2
      t.integer :days_past_due, default: 0, null: false
      t.datetime :archived_at

      t.timestamps
      t.index :account_number
    end
  end
end
