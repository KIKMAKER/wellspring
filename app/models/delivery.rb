class Delivery < ApplicationRecord
  belongs_to :user
  belongs_to :delivery_day

  belongs_to :payment, optional: true

  validates :drivers_day_id, uniqueness: { scope: :user_id, message: "already booked for this day" }
end
