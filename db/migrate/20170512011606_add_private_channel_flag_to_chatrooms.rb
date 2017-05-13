class AddPrivateChannelFlagToChatrooms < ActiveRecord::Migration[5.0]
  def change
    add_column :chatrooms, :private_channel, :boolean, default: false
  end
end
