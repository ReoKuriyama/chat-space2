FactoryGirl.define do

  factory :message do
    body     "hello"
    image    File.open(File.join(Rails.root, '/spec/image/test.jpg'))
    group_id "1"
    user_id  "1"
  end
end
