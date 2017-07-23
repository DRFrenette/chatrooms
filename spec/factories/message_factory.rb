FactoryGirl.define do
  factory :message do
    association :chatroom
    association :user
    sequence(:body) { |i| "Soup is so awesome" }
  end
end
