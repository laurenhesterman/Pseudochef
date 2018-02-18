FactoryGirl.define do
  factory :recipe do
    title "MyString"
    description "MyText"
    ingredients "MyText"
    level 1
    time 1
    modifications "MyString"
    text "MyText"
    links "MyString"
    user nil
  end
end
