class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
      t.string :name
      t.integer :active_round
      t.boolean :posted, default: false

      t.timestamps
    end
  end
end
