class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :invoice
  has_many :deliveries

  validates :total_amount, presence: true, numericality: { greater_than: 0 }
  validates :snapscan_id, presence: true, uniqueness: true
end
