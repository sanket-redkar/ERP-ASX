class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :name
      t.references :reporting, foreign_key: true
      t.references :owner, foreign_key: true

      t.timestamps
    end
    add_attachment :images, :image
  end
end
