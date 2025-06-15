class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :delivery_days, dependent: :nullify
  has_many :deliveries, dependent: :destroy
  has_many :payments, dependent: :nullify
  enum role: { customer: 0, driver: 1, admin: 2 }

  validates :name, :phone_number, :address, presence: true
end
