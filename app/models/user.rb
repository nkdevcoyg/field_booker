class User < ApplicationRecord

  has_many :payments
  has_many :bookings

  validates :first_name, length: { minimum: 2 }, format: { with: /\A[a-zA-Z]+\z/,
                                                                           message: "only allows letters" }
  validates :last_name, length: { minimum: 2 }, format: { with: /\A[a-zA-Z]+\z/,
                                                                          message: "only allows letters" }
  validates :phone_number, numericality: true
  validates :encrypted_password, length: { in: 6..20 }
  validates :first_name, :last_name, :phone_number, :encrypted_password, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
