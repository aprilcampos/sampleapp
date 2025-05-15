# Destroy existing records in dependent order
Technology.destroy_all
Portfolio.destroy_all
Skill.destroy_all
Blog.destroy_all
Topic.destroy_all
User.destroy_all

# Reset primary key sequences (PostgreSQL-specific)
tables = %w[technologies portfolios skills blogs topics users]
tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

# Users - start
User.find_or_create_by!(email: "admin@example.com") do |user|
  user.password = "123456"
  user.password_confirmation = "123456"
  user.name = "Admin User"
  user.roles = "site_admin"
end

puts "1 Admin user created"

User.find_or_create_by!(email: "user@example.com") do |user|
  user.password = "123456"
  user.password_confirmation = "123456"
  user.name = "Regular User"
end

puts "1 regular user created"
# Users - end

# Topics - start
topics = [
  Topic.create!(title: "Ruby on Rails"),
  Topic.create!(title: "API Integration"),
  Topic.create!(title: "Software Development")
]

puts "3 Topics created"
# Topics - end

# Blogs - start
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
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
    topic_id: topics.sample.id,
    status: :draft
  )
end

puts "8 draft blog posts created"
# Blogs - end

# Skills - start
skills = [
  { title: "Ruby", percent_utilized: 80 },
  { title: "Ruby on Rails", percent_utilized: 90 },
  { title: "HTML", percent_utilized: 100 },
  { title: "CSS", percent_utilized: 100 },
  { title: "JavaScript", percent_utilized: 65 },
  { title: "Stimulus", percent_utilized: 80 },
  { title: "jQuery", percent_utilized: 80 },
  { title: "PostgreSQL", percent_utilized: 80 },
  { title: "MySQL", percent_utilized: 80 },
  { title: "Bootstrap", percent_utilized: 100 },
  { title: "TailwindCSS", percent_utilized: 100 },
  { title: "Zurb Foundation", percent_utilized: 100 },
  { title: "Linux OS", percent_utilized: 100 },
  { title: "RSpec", percent_utilized: 35 },
  { title: "AWS", percent_utilized: 58 },
  { title: "Git", percent_utilized: 100 },
  { title: "Github", percent_utilized: 100 },
  { title: "Gitlab", percent_utilized: 100 }
]

skills.each do |skill|
  Skill.create!(skill)
end

puts "#{Skill.count} skills created"
# Skills - end

# Portfolios and Technologies - start
# Portfolio Website with all advanced features
sampleapp = Portfolio.create!(
  title: "Portfolio Website",
  subtitle: "Full-featured Rails Application with Authentication, Authorization, Real-time Features, and AWS Integration",
  body: "This ongoing Ruby on Rails portfolio project includes several advanced features beyond basic CRUD. " \
        "It features full user authentication (sign up, log in, log out) using Devise and role-based authorization. " \
        "Portfolios and blog entries can be created, updated, and deleted, with drag-and-drop reordering powered by Stimulus and Sortable.js. " \
        "Real-time comments are implemented using Action Cable (Rails channels), enabling live updates without page reloads. " \
        "The app also includes custom route constraints, a custom Ruby gem made by myself, and file uploads using Active Storage backed by AWS S3 with IAM security. " \
        "The interface is clean and responsive, built with Bootstrap and modern JavaScript enhancements.",
  main_image: "app/assets/images/portfolio-1.png",
  thumb_image: "app/assets/images/portfolio-1.png",
  position: 1
)

sampleapp.technologies.create!([
  { name: "HTML" },
  { name: "CSS" },
  { name: "JavaScript" },
  { name: "Ruby" },
  { name: "Ruby on Rails 7" },
  { name: "RESTful API" },
  { name: "Action Cable" },
  { name: "Turbo (Hotwire)" },
  { name: "Stimulus" },
  { name: "Sortable.js" },
  { name: "Devise" },
  { name: "AWS S3 + IAM" },
  { name: "Custom Ruby Gem" },
  { name: "PostgreSQL" },
  { name: "Bootstrap" }
])

# Quote Editor
quote_editor = Portfolio.create!(
  title: "Quote Editor",
  subtitle: "Single-page, Reactive Quote Editor Application built with Ruby on Rails 7 and Turbo",
  body: "This ongoing application is a single-page, reactive quote editor. It was built with Ruby on Rails 7 and Turbo. " \
        "The application supports real-time updates using Turbo Streams and WebSockets, and exposes a RESTful API for integration. " \
        "It features dynamic form handling, live previews, and version tracking for quotes, all without requiring full-page reloads.",
  main_image: "app/assets/images/portfolio-2.png",
  thumb_image: "app/assets/images/portfolio-2.png",
  position: 2
)

quote_editor.technologies.create!([
  { name: "HTML" },
  { name: "CSS" },
  { name: "JavaScript" },
  { name: "Ruby" },
  { name: "Ruby on Rails 7" },
  { name: "Hotwire (Turbo + Stimulus)" },
  { name: "SCSS" },
  { name: "WebSockets" },
  { name: "PostgreSQL" },
  { name: "RESTful API" }
])

# Simple Blog
blog_app = Portfolio.create!(
  title: "Simple Blog",
  subtitle: "Beginner-friendly Blog Application built by following Rails Guides",
  body: "This blog application was built as a learning project following the official 'Getting Started with Rails' guide. " \
        "It allows users to create, edit, and delete articles, as well as post comments. The project introduced fundamental " \
        "Rails concepts such as MVC architecture, routing, models, controllers, views, form helpers, validations, and partials.",
  main_image: "app/assets/images/portfolio-3.png",
  thumb_image: "app/assets/images/portfolio-3.png",
  position: 3
)

blog_app.technologies.create!([
  { name: "HTML" },
  { name: "CSS" },
  { name: "Ruby" },
  { name: "Ruby on Rails" },
  { name: "SQLite3" },
  { name: "ERB" },
  { name: "RESTful API" }
])

# Custom Gem
custom_gem = Portfolio.create!(
  title: "Custom Ruby Gem",
  subtitle: "Ruby Gem: AccamposViewTool for Reusable View Helpers",
  body: "This gem (`AccamposViewTool`) was built to encapsulate reusable view-related helpers like copyright rendering. " \
        "It follows RubyGems conventions and is structured with modules and a renderer class. It was used in the portfolio application " \
        "and can be published for broader use.",
  main_image: "app/assets/images/portfolio-4.png",
  thumb_image: "app/assets/images/portfolio-4.png",
  position: 4
)

custom_gem.technologies.create!([
  { name: "Ruby" },
  { name: "AccamposViewTool (Custom Gem)" }
])

# Instagram Clone
instaclone = Portfolio.create!(
  title: "Instagram Clone",
  subtitle: "Social Media App with Real-time Features Built in Ruby on Rails 7",
  body: "This Instagram-style social media application is built using Ruby on Rails 7, PostgreSQL, and Hotwire (Turbo & Stimulus). " \
        "Users can create posts, follow others, and interact in real time. It includes a live notifications system powered by Action Cable, " \
        "which updates followers instantly when someone likes or comments on a post. The design is styled using Bootstrap 5 and Sass, " \
        "and Popper.js is used to enhance interactive UI elements. This project demonstrates real-time interactivity, modern frontend tools, " \
        "and a fully relational database model suitable for scalable social features.",
  main_image: "app/assets/images/portfolio-5.png",
  thumb_image: "app/assets/images/portfolio-5.png",
  position: 5
)

instaclone.technologies.create!([
  { name: "Ruby on Rails 7" },
  { name: "Turbo" },
  { name: "Stimulus" },
  { name: "Action Cable" },
  { name: "Bootstrap" },
  { name: "Sass" },
  { name: "Popper.js" },
  { name: "PostgreSQL" },
  { name: "Real-time Notifications" }
])

# Bootstrap Frontend Site
bootstrap_site = Portfolio.create!(
  title: "Front-End Website",
  subtitle: "My First Responsive Website Built with HTML, CSS, and Bootstrap 5",
  body: "This was my first frontend project, built entirely using HTML, CSS, and Bootstrap 5. It features a clean and responsive layout, " \
        "a sticky navigation bar, interactive components like modals and carousels, and consistent styling using Bootstrap's utility classes. " \
        "Through this project, I learned how to use Bootstrap's grid system, layout utilities, and built-in JavaScript plugins to build a polished and mobile-friendly interface.",
  main_image: "app/assets/images/portfolio-6.png",
  thumb_image: "app/assets/images/portfolio-6.png",
  position: 6
)

bootstrap_site.technologies.create!([
  { name: "Bootstrap 5" },
  { name: "HTML5" },
  { name: "CSS3" },
  { name: "Responsive Design" }
])
# Portfolios and Technologies - end