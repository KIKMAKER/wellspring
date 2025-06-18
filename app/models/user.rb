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
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  SUBURBS = ["Bantry Bay", "Camps Bay", "Clifton", "Fresnaye", "Green Point", "Hout Bay", "Mouille Point", "Sea Point", "Three Anchor Bay", "Bo-Kaap (Malay Quarter)", "Devil's Peak Estate", "De Waterkant", "Foreshore", "Gardens", "Higgovale", "Lower Vrede (District Six)", "Oranjezicht", "Salt River", "Schotsche Kloof", "Tamboerskloof", "University Estate", "Vredehoek", "Walmer Estate (District Six)", "Woodstock (including Upper Woodstock)", "Zonnebloem (District Six)", "Bishopscourt", "Claremont", "Constantia", "Harfield Village", "Mowbray", "Newlands", "Observatory", "Rondebosch", "Rondebosch East", "Rosebank"].sort!.freeze
end
