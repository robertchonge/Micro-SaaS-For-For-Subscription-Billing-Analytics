class CreateInvoices < ActiveRecord::Migration[7.1]
  def change
    create_table :invoices do |t|
      t.references :client, null: false, foreign_key: true
      t.references :subscription, null: false, foreign_key: true
      t.integer :amount_cents
      t.string :status
      t.date :due_date
      t.timestamps
    end
  end
end
