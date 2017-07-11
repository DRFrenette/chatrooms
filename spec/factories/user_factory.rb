FactoryGirl.define do
  factory :user do
    sequence(:name) { |i| "King Henry the #{i.ordinalize}" }
    sequence(:email) { |i| "Paradox#{i}@example.com" }
    password "P@ssw0rd"
  end
end
