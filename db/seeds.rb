# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Owner
  owner = Owner.create(name: 'Times Innovative Media')

  owner.clients.build({name: 'Bajaj'}).save
  owner.clients.build({name: 'Xerbia'}).save

# OohSite
require 'csv'
CSV.read("#{Rails.root}/db/ooh_sites.csv").each do |data|
  ooh_site = OohSite::Metro.find_or_initialize_by({code: data[0], name: data[1], location: data[3], address: data[1], owner_id: owner.id })
  ooh_site.save
end
