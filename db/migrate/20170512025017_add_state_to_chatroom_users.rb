class AddStateToChatroomUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :chatroom_users, :state, :string, default: "pending"
  end
end
