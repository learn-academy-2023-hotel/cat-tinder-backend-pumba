dogs = [
    {
        name: 'Nova',
        age: 1,
        enjoys: "coffee and walks",
        image: "https://www.spectator.co.uk/wp-content/uploads/2023/08/iStock-1219024079.webp"
    },
    {
        name: 'Taylor',
        age: 11,
        enjoys: "sleeping",
        image: "https://www.akc.org/wp-content/uploads/2017/11/Lhasa-Apso-On-White-01.jpg"
    },
    {
        name: 'Zetti',
        age: 6,
        enjoys: "jogging",
        image: "https://dogtime.com/wp-content/uploads/sites/12/2011/01/GettyImages-1455758529-e1688370717758.jpg?w=1024"
    },
]

dogs.each do |each_dog|
    Dog.create each_dog
    puts "creating dog #{each_dog}"
end