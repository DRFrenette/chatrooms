FactoryGirl.define do
  factory :chatroom_membership do
    association :chatroom
    association :user
  end
end
