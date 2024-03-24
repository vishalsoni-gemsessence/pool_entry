class Customer < ApplicationRecord
  validates :contact_number, presence: true
  validates :name, presence: true
  validates :address, presence: true
end
