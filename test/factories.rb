FactoryGirl.define do
  factory :user do
    email "shin.php@gmail.com"
    password "password"
    password_confirmation "password"
  end

  factory :user_info do
  	username "Shin"
  	bio "Hello Word!"
    user
  end
end