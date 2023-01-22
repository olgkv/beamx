class ServiceProvider < ApplicationRecord
  has_many :appointments, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
