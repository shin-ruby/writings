FactoryGirl.define do
  factory :user do
    email "shin.php@gmail.com"
    username "Shin"
    password "password"
    password_confirmation "password"
  end

  factory :user_info do
  	bio "Hello Word!"
    user
  end

  factory :writing do
    title "The Rails"
    content "Rails 是使用 Ruby 语言编写的网页程序开发框架，目的是为开发者提供常用组件，简化网页程序的开发。只需编写较少的代码，就能实现其他编程语言或框架难以企及的功能。经验丰富的 Rails 程序员会发现，Rails 让程序开发变得更有乐趣。"
    photo "rails.png"
    user
  end
  
end