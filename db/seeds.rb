require 'random_data'

p = Post.find_or_create_by!(title: "Test post please ignore", body: "Test body please ignore")
Comment.find_or_create_by!(post: p, body: "Test comment please ignore")

50.times do
    Post.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph
    )
end

50.times do
    Advertisement.create!(
        title: RandomData.random_sentence,
        copy: RandomData.random_paragraph,
        price: rand(1000)
    )
end

50.times do
    Question.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph,
        resolved: false
    )
end

posts = Post.all

100.times do
    Comment.create!(
        post: posts.sample,
        body: RandomData.random_paragraph
    )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} ads created"
