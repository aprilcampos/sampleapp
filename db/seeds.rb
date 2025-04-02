10.times do |topic|
    Topic.create!(
        title: "Topic #{topic}"
    )
end

puts "3 topics created"

10.times do |blog|
    Blog.create!(
        title: "My Blog Post #{blog}",
        body: "Sed ut perspiciatis unde omnis iste natus error sit 
        voluptatem accusantium doloremque laudantium, totam rem aperiam, 
        eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae 
        vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit 
        aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui 
        ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum 
        quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius 
        modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.",
        topic_id: Topic.last.id
    )
end

puts "10 blog posts created"

5.times do |skill|
    Skill.create!(
        title: "Rails #{skill}",
        percent_utilized: 15
    )
end

puts "5 skills created"

8.times do |portfolio_item|
    Portfolio.create!(
        title: "Portfolio title: #{portfolio_item}",
        subtitle: "Ruby on Rails",
        body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium,
         totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta 
         sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia 
         consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui 
         dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora 
         incidunt ut labore et dolore magnam aliquam quaerat voluptatem.",
        main_image: "https://pixy.org/ph/06139e/7a7a7a/frame/crosshairs/600x400.png",
        thumb_image: "https://tse4.mm.bing.net/th?id=OIP.4L0hr_SUbeH1q-I2KrFg0QAAAA&pid=Api&P=0"
    )
end

1.times do |portfolio_item|
    Portfolio.create!(
        title: "Portfolio title: #{portfolio_item}",
        subtitle: "Angular",
        body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium,
         totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta 
         sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia 
         consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui 
         dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora 
         incidunt ut labore et dolore magnam aliquam quaerat voluptatem.",
        main_image: "https://pixy.org/ph/06139e/7a7a7a/frame/crosshairs/600x400.png",
        thumb_image: "https://tse4.mm.bing.net/th?id=OIP.4L0hr_SUbeH1q-I2KrFg0QAAAA&pid=Api&P=0"
    )
end

puts "9 portfolio items created"

3.times do |technology|
    Portfolio.last.technologies.create!(
        name: "Technology #{technology}"
    )
end

puts "3 technologies created"
