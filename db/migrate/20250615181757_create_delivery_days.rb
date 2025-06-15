class CreateDeliveryDays < ActiveRecord::Migration[7.1]
  def change
    create_table :delivery_days do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.integer :capacity, default: 20
      t.integer :filled_slots, default: 0
      t.integer :start_kms
      t.integer :end_kms
      t.datetime :start_time
      t.datetime :end_time

      t.string :note

      t.timestamps
    end
  end
end
