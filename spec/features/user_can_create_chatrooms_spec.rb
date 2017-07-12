require "spec_helper"

feature "user can create a chatroom -", :js do
  let(:user) { create :user }
  let!(:friend) { create :user }
  let(:chatroom_name) { "Hot and sour soup fan page".upcase }
  let(:truncated_chatroom_name) { chatroom_name[0..13] + "..." }

  specify "that is open to all users" do
    sign_in_user(user)
    click_link "Start a New Chat"

    fill_in "chatroom_name", with: chatroom_name
    select2 friend.name, from: "chatroom_user_ids"
    click_on "Create Chatroom"

    open_side_panel
    within "#current-chatrooms" do
      expect(page).to have_content truncated_chatroom_name
    end

    close_side_panel
    sign_out_user
    sign_in_user(friend)

    expect(page).to have_content chatroom_name
  end

  specify "with a private setting" do
    sign_in_user(user)
    click_link "Start a New Chat"

    fill_in "chatroom_name", with: chatroom_name
    find(".bootstrap-switch-label").click
    select2 friend.name, from: "chatroom_user_ids"
    click_on "Create Chatroom"

    open_side_panel
    within "#current-chatrooms" do
      expect(page).to have_content truncated_chatroom_name
    end

    close_side_panel
    sign_out_user
    sign_in_user(friend)
    open_side_panel

    within "#chatroom-invites" do
      expect(page).to have_content truncated_chatroom_name
    end
  end
end
