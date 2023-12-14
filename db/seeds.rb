dogs = [
    {
        name: 'Nova',
        age: 1,
        enjoys: "coffee and walks",
        location: "San Diego, CA",
        image: "https://www.spectator.co.uk/wp-content/uploads/2023/08/iStock-1219024079.webp",
        # image2: "https://betterpet.com/wp-content/uploads/2023/02/american-bully.jpeg",
        # image3: "https://upload.wikimedia.org/wikipedia/commons/5/58/Cirock_American_Bully_Female_%288597745629%29.jpg",
        # image4: "https://bullyfiendz.com/wp-content/uploads/2019/03/tri-color-american-bully-puppies.jpg",
    },
    {
        name: 'Taylor',
        age: 11,
        enjoys: "sleeping and snoring",
        location: "San Diego, CA",
        image: "https://www.akc.org/wp-content/uploads/2017/11/Lhasa-Apso-On-White-01.jpg",
        # image2: "https://jiminys.com/cdn/shop/articles/Depositphotos_87766636_S_68bc9d9a-1ef3-4234-bb73-9cae6bb8329c.jpg?v=1673977811",
        # image3: "https://www.poochandmutt.co.uk/cdn/shop/articles/download_1_427aa653-a9fc-4ac5-9d93-a92c7ee3e86f.jpg?v=1627377045",
        # image4: "https://www.purina.co.uk/sites/default/files/styles/ttt_image_510/public/2021-01/Welsh%20Corgi%20%28Pembroke%291.jpg?itok=-ALFB8xn",
    },
    {
        name: 'Zetti',
        age: 6,
        enjoys: "jogging and playing with my unicorn toy",
        location: "San Diego, CA",
        image: "https://dogtime.com/wp-content/uploads/sites/12/2011/01/GettyImages-1455758529-e1688370717758.jpg?w=1024",
        # image2: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Maltipoo_Dog_-_Poodle_Maltese_Mix_Breed.jpg/640px-Maltipoo_Dog_-_Poodle_Maltese_Mix_Breed.jpg",
        # image3: "https://d3544la1u8djza.cloudfront.net/APHI/Blog/2020/05-07/Maltipoo+FAQs+Answered+_+Size+Shedding+and+Care+_+ASPCA+Pet+Health+Insurance+_+Maltese+Poodle+gazing+into+the+camera-min.jpg",
        # image4: "https://www.pumpkin.care/wp-content/uploads/2021/03/Maltipoo-Hero-jpg.webp",
    },
]

dogs.each do |each_dog|
    Dog.create each_dog
    puts "creating dog #{each_dog}"
end