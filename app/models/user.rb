class User < ApplicationRecord
  # has_many :users, dependent: :destroy
  belongs_to :booking
  has_one :payment
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
