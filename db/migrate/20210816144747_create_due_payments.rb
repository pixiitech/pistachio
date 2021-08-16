class CreateDuePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :due_payments do |t|
      t.date :billing_date, null: false
      t.date :due_date, null: false
      t.decimal :amount, default: 0, null: false, precision: 12, scale: 2
      t.boolean :paid, default: false
      t.references :loan

      t.timestamps
    end
  end
end
