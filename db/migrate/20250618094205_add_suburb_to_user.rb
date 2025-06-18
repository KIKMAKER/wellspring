class AddSuburbToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :suburb, :string
  end
end
