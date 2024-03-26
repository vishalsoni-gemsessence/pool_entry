class Customer < ApplicationRecord
  has_many :entry_bookings, dependent: :destroy

  validates :contact_number, presence: true, uniqueness: true
  validates :name, presence: true
  validates :address, presence: true

  broadcasts_to ->(customer) { "customers" }, inserts_by: :prepend
end
