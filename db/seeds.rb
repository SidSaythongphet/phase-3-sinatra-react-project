puts "🌱 Seeding spices..."

10.times do
    first = Faker::Name.first_name
    last = Faker::Name.last_name
    username = last + first
    user = User.create(first_name: first, last_name: last, username: username, password: "12345" )
end 

(1..10).each { |i| Club.create(club_title: "#{Faker::Hobby.activity} Club", description: Faker::Lorem.paragraph(sentence_count: 4)) }

4.times { (1..10).each { |i| UserClub.create(user_id: i, club_id: rand(1..Club.all.length)) } }

20.times { Event.create(event_title: Faker::Lorem.sentence(word_count: 5), event_date: Faker::Date.forward(days: rand(1..14)), club_id: rand(1..Club.all.length)) }
20.times { Event.create(event_title: Faker::Lorem.sentence(word_count: 5), event_date: Faker::Date.backward(days: rand(1..14)), club_id: rand(1..Club.all.length)) }

50.times { Post.create(content: Faker::Lorem.paragraph(sentence_count: rand(2..8)), user_id: rand(1..User.all.length), club_id: rand(1..Club.all.length)) }

puts "✅ Done seeding!"
