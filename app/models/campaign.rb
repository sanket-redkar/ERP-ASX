class Campaign < ApplicationRecord

  belongs_to :client
  belongs_to :owner

  validates :client_id, :name, presence: true
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def fetch_available_dates(params)
    _array = []
    available_ooh_sites = Hash.new([])
    _starts_on = Date.parse( params[:starts_on] || self.starts_on.to_s )
    _ends_on = Date.parse( params[:ends_on] || self.ends_on.to_s )
    OohSite.where(id: params[:ooh_site_id]).each do |ooh_site|
      _hash = ooh_site.as_json
      _hash[:available_dates] = (_starts_on.._ends_on).to_a - Reporting.where(ooh_site_id: ooh_site.id, date: _starts_on.._ends_on ).pluck(:date)
      _array << _hash
    end
    _array
  end
end
