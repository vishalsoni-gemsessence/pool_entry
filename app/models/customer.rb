class Customer < ApplicationRecord
  has_many :entry_bookings, dependent: :destroy

  validates :contact_number, presence: true, uniqueness: true
  validates :name, presence: true
  validates :address, presence: true

  accepts_nested_attributes_for :entry_bookings

  broadcasts_to ->(customer) { "customers" }, inserts_by: :prepend
end
