puts "🌱 Seeding spices..."

10.times do
    first = Faker::Name.first_name
    last = Faker::Name.last_name
    username = last + first
    User.create(first_name: first, last_name: last, username: username, password: "12345" )
end 

5.times { Club.create(club_title: "#{Faker::Hobby.activity} Club", description: Faker::Lorem.paragraph(sentence_count: 4)) }

(1..10).each { |i| UserClub.create(user_id: i, club_id: rand(1..Club.all.length)) }

5.times { Event.create(event_title: Faker::Lorem.sentence(word_count: 3), event_date: Faker::Date.forward(days: 14), club_id: rand(1..Club.all.length)) }

puts "✅ Done seeding!"
