FactoryGirl.define do
  factory :chatroom do
    sequence(:name) { |i| "Soup Chat - the number #{i} best chat" }
    private_channel false
  end
end
