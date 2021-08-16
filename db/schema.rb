# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_16_144752) do

  create_table "due_payments", force: :cascade do |t|
    t.date "billing_date", null: false
    t.date "due_date", null: false
    t.decimal "amount", precision: 12, scale: 2, default: "0.0", null: false
    t.boolean "paid", default: false
    t.integer "loan_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["loan_id"], name: "index_due_payments_on_loan_id"
  end

  create_table "loans", force: :cascade do |t|
    t.integer "account_number", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "start_date"
    t.decimal "financed_amount", precision: 12, scale: 2, default: "0.0", null: false
    t.decimal "payment_amount", precision: 12, scale: 2, default: "0.0", null: false
    t.decimal "interest_rate", precision: 12, scale: 2, default: "0.0", null: false
    t.integer "term", default: 0, null: false
    t.decimal "principal_balance", precision: 12, scale: 2, default: "0.0", null: false
    t.decimal "interest_balance", precision: 12, scale: 2, default: "0.0", null: false
    t.decimal "fees_balance", precision: 12, scale: 2, default: "0.0", null: false
    t.integer "days_past_due", default: 0, null: false
    t.datetime "archived_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_number"], name: "index_loans_on_account_number"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "loan_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["loan_id"], name: "index_payments_on_loan_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "transaction_type", null: false
    t.date "effective_date", null: false
    t.decimal "principal_change", precision: 12, scale: 2, default: "0.0", null: false
    t.decimal "interest_change", precision: 12, scale: 2, default: "0.0", null: false
    t.decimal "fees_change", precision: 12, scale: 2, default: "0.0", null: false
    t.boolean "reversed", default: false
    t.boolean "reversal", default: false
    t.integer "loan_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["loan_id"], name: "index_transactions_on_loan_id"
  end

end
