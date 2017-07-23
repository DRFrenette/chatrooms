require 'spec_helper'

describe Message do
  describe "Associations" do
    it { should belong_to(:chatroom) }
    it { should belong_to(:user) }
  end

  describe "Validations" do
    it { should validate_presence_of :body }
    it { should validate_presence_of :chatroom }
    it { should validate_presence_of :user }
  end
end
