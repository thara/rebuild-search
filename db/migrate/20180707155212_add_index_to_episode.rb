class AddIndexToEpisode < ActiveRecord::Migration[5.1]
  def change
    add_index :episodes, :title
    add_index :episodes, :description
  end
end
