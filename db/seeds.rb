User.create!(
  email: "admin@test.com",
  password: "123456",
  password_confirmation: "123456",
  name: "Admin User",
  roles: "site_admin"
)

puts "1 Admin user created"

User.create!(
  email: "reg@test.com",
  password: "123456",
  password_confirmation: "123456",
  name: "Regular User",
)

puts "1 regular user created"

# Create specific topics
topics = [
  Topic.create!(title: "Ruby on Rails"),
  Topic.create!(title: "API Integration"),
  Topic.create!(title: "Software Development")
]

puts "3 Topics created"

# Create 2 published blog articles

Blog.create!(
  title: "Mastering Hotwire in Rails 7: A Beginner's Guide",
  body: <<~BODY,
    Hotwire is one of the most exciting additions to the modern Rails stack. Introduced by Basecamp, it allows developers to build fast, interactive web applications without writing much custom JavaScript.

    In this article, we’ll walk through the core concepts of Hotwire, how it integrates with Rails 7, and how you can start using it today to improve the user experience of your application.

    ## What is Hotwire?

    Hotwire stands for **HTML Over The Wire**. Instead of relying on a front-end JavaScript framework like React or Vue, Hotwire sends HTML from the server to update the DOM. It’s composed of:
    
    - **Turbo Drive** for navigation
    - **Turbo Frames** for partial page updates
    - **Turbo Streams** for real-time broadcasting
    - **Stimulus** for lightweight JavaScript behavior

  BODY
  status: :published,
  topic_id: topics[0].id # Ruby on Rails
)

Blog.create!(
  title: "How to Stay Productive as a Remote Software Developer",
  body: <<~BODY,
    Working remotely as a software developer offers flexibility but also comes with challenges. Over the past few years, remote work has evolved from a luxury to a necessity.

    Here are a few tips to stay productive:

    1. **Set clear boundaries** between work and personal life.
    2. **Stick to a routine**—start and end your work at consistent times.
    3. **Overcommunicate** with your team using tools like Slack, Notion, and Zoom.
    4. **Stay focused** using techniques like Pomodoro or time blocking.


    Embrace remote work, but don’t forget to recharge and socialize offline too!
  BODY
  status: :published,
  topic_id: topics[2].id # Software Development
)

puts "2 real blog posts created"

# Create 8 draft blogs
8.times do |i|
  Blog.create!(
    title: "My Blog Post #{i + 3}",
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua...",
    topic_id: topics.sample.id,
    status: :draft
  )
end

puts "8 draft blog posts created"

skills = [
  { title: "Ruby", percent_utilized: 80 },
  { title: "Ruby on Rails", percent_utilized: 90 },
  { title: "HTML", percent_utilized: 100 },
  { title: "CSS", percent_utilized: 100 },
  { title: "JavaScript", percent_utilized: 75 }
]

skills.each do |skill|
  Skill.create!(skill)
end

puts "#{Skill.count} skills created"

8.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio title: #{portfolio_item}",
    subtitle: "Ruby on Rails",
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    main_image: "http://placehold.it/600x400",
    thumb_image: "http://placehold.it/350x200"
  )
end

1.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio title: #{portfolio_item}",
    subtitle: "Angular",
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    main_image: "http://placehold.it/600x400",
    thumb_image: "http://placehold.it/350x200"
  )
end

puts "9 portfolio items created"

3.times do |technology|
  Portfolio.last.technologies.create!(
    name: "Technology #{technology}"
  )
end

puts "3 technologies created"