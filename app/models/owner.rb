class Owner < ApplicationRecord

  validates :name, uniqueness: true, presence: true

  has_many :clients
  has_many :campaigns
  has_many :ooh_sites
end
