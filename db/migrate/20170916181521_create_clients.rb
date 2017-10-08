class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.references :owner, foreign_key: true

      t.timestamps
    end
  end
end
