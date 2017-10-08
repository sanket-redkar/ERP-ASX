json.extract! campaign, :id, :name, :image, :starts_on, :ends_on, :created_at, :updated_at
json.url campaign_url(campaign, format: :json)
