class CreateCampaigns < ActiveRecord::Migration[5.0]
  def change
    create_table :campaigns do |t|
      t.string :name

      t.date :starts_on
      t.date :ends_on

      t.references :owner, foreign_key: true
      t.references :client, foreign_key: true

      t.timestamps
    end
    add_attachment :campaigns, :image
  end
end
