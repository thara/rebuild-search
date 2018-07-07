class AddIndexToCastMember < ActiveRecord::Migration[5.1]
  def change
    add_index :cast_members, :name
  end
end
