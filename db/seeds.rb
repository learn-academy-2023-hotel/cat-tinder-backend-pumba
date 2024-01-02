user1 = User.where(email: "test1@example.com").first_or_create(password: "password", password_confirmation: "password")
user2 = User.where(email: "test2@example.com").first_or_create(password: "password", password_confirmation: "password")

user1_dogs = [
    {
        name: 'Nova',
        age: 1,
        enjoys: "coffee and walks",
        location: "San Diego, CA",
        image: "https://www.spectator.co.uk/wp-content/uploads/2023/08/iStock-1219024079.webp",
    }
]
 user2_dogs =[   
    {
        name: 'Taylor',
        age: 11,
        enjoys: "sleeping and snoring",
        location: "San Diego, CA",
        image: "https://www.akc.org/wp-content/uploads/2017/11/Lhasa-Apso-On-White-01.jpg",
    },
    {
        name: 'Zetti',
        age: 6,
        enjoys: "jogging and playing with my unicorn toy",
        location: "San Diego, CA",
        image: "https://dogtime.com/wp-content/uploads/sites/12/2011/01/GettyImages-1455758529-e1688370717758.jpg?w=1024",
    },
]

user1_dogs.each do |each_dog|
    user1.dogs.create each_dog
    puts "creating dog #{each_dog}"
end

user2_dogs.each do |each_dog|
    user2.dogs.create each_dog
    puts "creating dog #{each_dog}"
end