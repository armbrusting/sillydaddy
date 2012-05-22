class AddUserToPhoto < ActiveRecord::Migration
  def change
  	add_column :photos, :user_id, :integer
  	add_column :photos, :content, :string
        add_index :photos, [:user_id, :created_at]
  end
end
