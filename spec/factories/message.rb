FactoryGirl.define do

  factory :message do
    body     "hello"
    image    File.open(File.join(Rails.root, '/spec/image/test.jpg'))
    user
    group
  end
end
