FactoryGirl.define do
  factory :section do
    name { Fake::Lorem.word }
    language_id nil
  end
end
