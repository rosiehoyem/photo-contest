class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :number
      t.references :contest, index: true

      t.timestamps
    end
  end
end
