class CreateOohSites < ActiveRecord::Migration[5.0]
  def change
    create_table :ooh_sites do |t|
      t.string :authority
      t.string :name
      t.string :type
      t.text :address
      t.string :locality
      t.string :location
      t.string :city
      t.integer :images_count

      t.string :code
      t.float :latitude
      t.float :longitude

      t.references :owner, foreign_key: true

      t.timestamps
    end

    add_attachment :ooh_sites, :image
  end
end
