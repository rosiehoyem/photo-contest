class AddApiKeyToContests < ActiveRecord::Migration
  def change
    add_column :contests, :api_key, :string
  end
end
