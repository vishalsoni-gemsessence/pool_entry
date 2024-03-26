class EntryType < ApplicationRecord
  self.inheritance_column = :type
  has_many :entry_bookings
end
