FactoryGirl.define do
  factory :message do
    body     'hello'
    image    File.open("#{Rails.root}/spec/images/test.jpg")
    user
    group
  end
end
