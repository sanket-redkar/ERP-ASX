class Campaign < ApplicationRecord

  belongs_to :client
  belongs_to :owner
  has_many :daily_reportings, class_name: 'Reporting::Daily'

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
      _hash['occupied_dates'] = Reporting::Daily.where(ooh_site_id: ooh_site.id, date: _starts_on.._ends_on).pluck(:date)
      _array << _hash
    end
    _array
  end

  def assign_site(ooh_site_id)
    _starts_on = (self.starts_on > Date.today ? self.starts_on : Date.today )
    _ends_on = self.ends_on

    (_starts_on.._ends_on).to_a.each do |_date|
      reporting = self.daily_reportings.build(ooh_site_id: ooh_site_id, date: _date)
      reporting.save
    end
  end
end
