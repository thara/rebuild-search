class CreateEpisodes < ActiveRecord::Migration[5.1]
  def change
    create_table :episodes do |t|
      t.integer :episode_no, null:false
      t.string :title, null: false
      t.string :link, null: false
      t.string :description, null: false
      t.string :subtitle, null: false

      t.timestamps
    end
  end
end
