class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :photo_id

      t.timestamps
    end

    add_index :votes, :user_id
    add_index :votes, :photo_id
    add_index :votes, [:user_id, :photo_id], unique:true
  end
end
