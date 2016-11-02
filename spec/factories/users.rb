FactoryGirl.define do
  sequence :name do |n|
   "SomeName#{n}"
  end
  sequence :email do |n|
   "example#{n}@email.com"
  end
  factory :user do
    name 
    email
    password '123456'    
    confirmed_at Time.now
  end
end
