require 'spec_helper'

describe User do
  describe "Associations" do
    it { should have_many(:chatrooms) }
    it { should have_many(:chatroom_memberships) }
    it { should have_many(:chatroom_invitations) }
    it { should have_many(:invited_chatrooms) }
    it { should have_many(:messages) }
  end

  describe "Validations" do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end
end
