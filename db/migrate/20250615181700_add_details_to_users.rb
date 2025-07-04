class AddDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :phone_number, :string
    add_column :users, :secondary_phone_number, :string
    add_column :users, :address, :string
    add_column :users, :role, :integer, default: 0
    add_column :users, :container_paid_at, :datetime
    add_column :users, :customer_id, :string
  end
end
