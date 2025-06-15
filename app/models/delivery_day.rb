class DeliveryDay < ApplicationRecord
  belongs_to :user
  has_many :deliveries, dependent: :nullify

  validates :date, presence: true, uniqueness: true
  validates :capacity, numericality: { greater_than: 0 }
end
