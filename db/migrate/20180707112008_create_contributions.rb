class CreateContributions < ActiveRecord::Migration[5.1]
  def change
    create_table :contributions do |t|
      t.references :episode, foreign_key: true
      t.references :cast_member, foreign_key: true

      t.timestamps
    end
  end
end
