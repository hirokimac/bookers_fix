class AddUserIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_id, :integer
    add_column :users, :introduction, :text
  end
end
