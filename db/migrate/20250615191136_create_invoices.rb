class CreateInvoices < ActiveRecord::Migration[7.1]
  def change
    create_table :invoices do |t|
      t.date :issued_date
      t.date :due_date
      t.integer :number
      t.float :total_amount
      t.boolean :status, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
