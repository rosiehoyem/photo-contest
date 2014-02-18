class AddInCompetitionToImages < ActiveRecord::Migration
  def change
    add_column :images, :in_competition, :boolean
  end
end
