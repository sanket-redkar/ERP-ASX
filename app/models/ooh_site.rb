class OohSite < ApplicationRecord

  validates_uniqueness_of :code

  validates_presence_of :owner_id

  belongs_to :owner

  has_many :campaigns
  has_many :clients, through: :campaigns
  has_many :reportings

  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  geocoded_by :address do |os, results|
    if geo = results.first
      os.latitude = geo.geometry.try(:[], 'location').try(:[], 'lat') if os.latitude.blank?
      os.longitude = geo.geometry.try(:[], 'location').try(:[], 'lng') if os.longitude.blank?
      os.city = geo.city if os.city.blank?
      os.locality = geo.formatted_address if os.locality.blank?
    end
  end

  after_validation :geocode



  class << self
    def subclass_names
      ['OohSite::Bqs', 'OohSite::Metro', 'OohSite::Airtport', 'OohSite::Skywalk', 'OohSite::Horlding']
    end
  end
end
