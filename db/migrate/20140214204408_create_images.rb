class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :flickr_id
      t.string :owner
      t.string :title
      t.string :url
      t.references :contest, index: true
      t.references :round, index: true

      t.timestamps
    end
  end
end
