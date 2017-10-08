class Reporting < ApplicationRecord

  belongs_to :campaign
  belongs_to :ooh_site

  scope :search_by_campaign_id, ->(campaign_id){ where(campaign_id: campaign_id) }
  scope :search_by_ooh_site_id, ->(ooh_site_id){ where(ooh_site_id: ooh_site_id) }
  scope :search_by_date, ->(dates){ where(date: dates.first..dates.last )}

  validates_uniqueness_of :date, scope: [:campaign_id, :ooh_site_id]

  class << self
    def subclass_names
      ['Reporting::Daily', 'Reporting::Mounting', 'Reporting::Monitoring']
    end

    def search_by(_hash={})
      _records = self.all
      _hash.each do |key, value|
        if self.respond_to?("search_by_#{key}")
          _records = _records.send("search_by_#{key}", value)
        end
      end
      _records
    end
  end

end
