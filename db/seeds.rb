# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!({
  name: "admin",
  username: "admin",
  email: "admin2@example.com",
  password: "foobar",
  admin: 1
})

5.times do |n|
  name = "JLPT N#{n+1}"
  description = "A great course for you to pass JLPT N#{n+1}"
  Course.create!({
    name: name,
    description: description,
    image: "https://elearningindustry.com/wp-content/uploads/2021/02/understanding-technology-terms-used-in-education.png"
  })
end

Course.create!({
    name: "IT Nihongo",
    description: "Best IT Nihongo course for everyone",
    image: "https://elearningindustry.com/wp-content/uploads/2021/02/understanding-technology-terms-used-in-education.png"
})

Course.create!({
    name: "BJT for everyone",
    description: "A very good course for everyone who want to take the BJT exam",
    image: "https://elearningindustry.com/wp-content/uploads/2021/02/understanding-technology-terms-used-in-education.png"})


User.create!({
  name: "test user",
  username: "testuser",
  email: "testuser@example.com",
  password: "foobar",
  admin: 0
})

user = User.find(2)
courses = Course.all
enrolling = courses[1..3]

enrolling.each{|enrolled| user.enroll(enrolled)}

5.times do |n|
  User.create!({
  name: "test user #{n+2}",
  username: "testuser#{n+2}",
  email: "testuser-#{n+2}@example.com",
  password: "foobar",
  admin: 0
})
end

course = Course.find_by id: 6
3.times do |n|
  course.lessons.create!({
    name: "Lesson number #{n}"
  })
end
