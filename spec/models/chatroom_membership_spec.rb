require 'spec_helper'

describe ChatroomMembership do
  describe "Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:chatroom) }
  end

  specify "#accept_membership" do
    membership = create(:chatroom_membership)
    membership.update(state: "pending")
    expect(membership.accept_membership).to be_truthy
    expect(membership.state).to eq("accepted")
  end
end
