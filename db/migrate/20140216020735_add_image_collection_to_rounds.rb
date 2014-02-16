class AddImageCollectionToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :image_collection, :string, array: true, default:[]
    add_column :rounds, :winner_collection, :string, array: true, default:[]
  end
end
