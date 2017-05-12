class RenameChatroomUserToChatroomMemberships < ActiveRecord::Migration[5.0]
  def change
    rename_table :chatroom_users, :chatroom_memberships
  end
end
