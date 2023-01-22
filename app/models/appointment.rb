class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :service_provider

  validates :date, presence: true
end
