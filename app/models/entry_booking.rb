class EntryBooking < ApplicationRecord
  belongs_to :customer
  belongs_to :entry_type

  scope :ordered, -> { order(created_at: :asc) }
end
