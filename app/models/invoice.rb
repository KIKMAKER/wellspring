class Invoice < ApplicationRecord
  belongs_to :user
  has_many :invoice_items, dependent: :destroy
  has_one :payment

  enum status: { pending: 0, paid: 1, cancelled: 2 }

  validates :issued_date, :due_date, presence: true
end
