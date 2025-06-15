class CreateDeliveries < ActiveRecord::Migration[7.1]
  def change
    create_table :deliveries do |t|
      t.references :user, null: false, foreign_key: true
      t.references :delivery_day, null: false, foreign_key: true
      t.boolean :paid
      t.boolean :bundle
      t.boolean :completed
      t.datetime :delivered_at
      t.string :customer_note
      t.references :payment, foreign_key: true

      t.timestamps
    end
  end
end
