class CreateReportings < ActiveRecord::Migration[5.0]
  def change
    create_table :reportings do |t|
      t.string :type
      t.date :date

      t.references :ooh_site, foreign_key: true
      t.references :campaign, foreign_key: true
      t.references :owner, foreign_key: true

      t.timestamps
    end
  end
end
