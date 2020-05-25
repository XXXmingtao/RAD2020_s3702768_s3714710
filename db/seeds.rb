# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "Example User",
    email: "example@railstutorial.org",
    password: "foobar123", 
    password_confirmation:"foobar123",
    admin: true,
    phone: "0253674578",
    activated: true,
    activated_at: Time.zone.now)

20.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    phone = rand.to_s[2..11]
    User.create!(name: name,
        email: email,
        password: password,
        password_confirmation: password,
        phone: phone,
        activated: true,
        activated_at: Time.zone.now)
end

User.create!(name: "RAD RMIT",
    email: "rad2020rmit@gmail.com",
    password: "password", 
    password_confirmation:"password",
    admin: true,
    phone: "0123456789",
    activated: true,
    activated_at: Time.zone.now)

["A.I.","V.R.","RMIT","Game","Rails","Go","Web","News","Ruby","Movie","5G","Node","IOS","AWS"].each {|str|
    Topic.create!(topic: str)
}

# Makuch, E., 2020. Unreal Engine 5 Announced, Impressive Graphics Showcased In PS5 Tech Demo. [online] GameSpot. Available at: <https://www.gamespot.com/articles/unreal-engine-5-announced-impressive-graphics-show/1100-6477208/> [Accessed 15 May 2020].
Post.create!(
    title:"Unreal Engine 5 Announced, Impressive Graphics Showcased In PS5 Tech Demo",
    topic:"Game",
    text:"In addition to Fortnite, Epic Games is known for creating the Unreal Engine that is used by studios worldwide to create games, while Disney uses it to help film The Mandalorian. Epic has now announced the next version, Unreal Engine 5, and it has bold ambitions. Unreal Engine 5 looks like a major improvement over Epic's previous engine, with technology that promises to eliminate texture pop-in, assets that can be easily transferred between film and video games, and brilliant fidelity. The footage shown during the demonstration is based on a fully-playable PS5 demo, despite not representing a full game. That has expectations very high for what Unreal Engine 5 is capable of.\n
    Unreal Engine 5 promises to deliver \"photorealism on par with movie CG and real life.\" To showcase the power of the new engine, Epic created a tech demo called \"Lumen in the Land of Nanite.\" The real-time demo, which you can see below, is running on the PlayStation 5.",
    view:5,
    comment:0,
    user_id:2
)

#Barbosa, A., 2020. PS5 Release Date Is Not October, Sony Clarifies. [online] GameSpot. Available at: <https://www.gamespot.com/articles/ps5-release-date-is-not-october-sony-clarifies/1100-6477161/> [Accessed 15 May 2020].
Post.create!(
    title:"PS5 Release Date Is Not October, Sony Clarifies",
    topic:"News",
    text:"Following a job listing suggesting that Sony will launch the PlayStation 5 this October, the company has stated that the month was included in error. The PS5 will not be launching in October, and the final release date--or even release window--is still unknown at this point. We'll have to wait for official word from Sony to learn when the console will launch.\n
    The job listing was created for a position at Sony Interactive Entertainment, and hosted on a Japanese recruitment website. The line in question mentioned that the PlayStation 5 would launch in October, which was the first mention of an exact release month for Sony's next-generation console.Japanese publication Famitsu contacted Sony for comment, who stated that the information was erroneously included by the recruitment company in question.\n
    Sony have been slowly revealing new details about the PS5 and its approach to the next-generation of its games. A few weeks ago, it revealed the DualSense 5; the PS5's official controller with a host of new functionality for games to take advantage on. It has also revealed PlayStation Studios, a new brand that collects all of its exclusives under one banner.\n
    By comparison, Microsoft have already revealed their new console, the Xbox Series X. Microsoft is also hosting monthly streams leading up to the launch of its new console, with the first showcasing third-party games scheduled to launch on the new hardware. Microsoft also had to clarify rumors of a potential Thanksgiving launch date for the Xbox Series X, after it was mentioned on its website.",
    view:4,
    comment:0,
    user_id:3
)

#Graham, J., 2020. Preparing For 5G Tech Growth: RMIT Partners With IBM On Australian-First Courses. [online] Rmit.edu.au. Available at: <https://www.rmit.edu.au/news/all-news/2020/may/5g-iot-courses> [Accessed 15 May 2020].
Post.create!(
    title:"Preparing for 5G tech growth: RMIT partners with IBM on Australian-first courses",
    topic:"5G",
    text:"RMIT will partner with IBM to deliver the Australian-first courses – Internet of Things (IoT) Strategy in the 5G Era and 5G Technology and the Opportunity for Business.
    The rollout of 5G is expected to revolutionise communications technology and transform the industrial internet by enabling Australian businesses to improve productivity and reduce costs thanks to faster download speeds, lower latency and higher capacity.
    These new co-designed courses will ready the Australian workforce for the future, by offering a practical approach to incorporating 5G-enabled IoT technology within an Australian business context.
    The courses will also help students understand the business implications and benefits of the burgeoning technology and apply strategic decisions to stay ahead of the technology curve.
    RMIT Online CEO Helen Souness said the newest additions to the Future Skills portfolio would help future-proof Australian businesses against industry disruption.
    “The advent of 5G technologies holds incredible economic potential for businesses and individuals,” she said.
    The upwards trend on IoT devices is expected to continue, with IDC predicting 41.6 billion devices globally by 2025.
    According to the GSMA, 5G is also anticipated to inject $2.2 trillion into the global economy by 2034.
    “For Australians to keep up with the hyperconnectivity that will ensue from the rollout of the 5G network, as well as the emergence of booming technologies like VR and AR, employers will need to understand the technological implications and business impacts from a strategic perspective,” Souness said.\n
    “For education to keep up with the breakneck speed of technology, we’re extremely proud to partner with leaders like IBM, to provide students with the essential tools and knowledge they’ll need to handle the technological implications of the 5G rollout.”\n
    IBM Australia and New Zealand Managing Director Katrina Troughton said the 5G rollout was a monumental opportunity for Australia’s tech innovators on a global scale.\n
    “Anticipation of the 5G rollout has been creating waves for years now and thanks to the vast pool of talent and skills we have in Australia, we have a unique opportunity to contribute to global 5G innovation in a remarkable way,” she said.\n
    “We’re thrilled to be at the forefront of 5G education and training as a result of our partnership with RMIT.”\n
    IoT Strategy in the 5G Era course runs for six weeks and covers the fundamentals of 5G, the implications of 5G on the IoT landscape, as well as key drivers and business impacts in the Australian business sector.\n
    5G Technology and Business Opportunities runs for one week and is designed for business leaders interested in gaining a deeper understanding of 5G technology.\n
    The online courses will be fully credentialed by RMIT University. Further information is available at RMIT Online.",
    view:3,
    comment:0,
    user_id:4
)

#Harris, O., 2020. Final Fantasy 9 Is Out Now On Xbox Game Pass. [online] GameSpot. Available at: <https://www.gamespot.com/articles/final-fantasy-9-is-out-now-on-xbox-game-pass/1100-6477306/> [Accessed 15 May 2020].
Post.create!(
    title:"Final Fantasy 9 Is Out Now On Xbox Game Pass",
    topic:"Game",
    text:"While we are halfway into May, Microsoft is still unveiling games coming to Xbox Game Pass for both PC and Xbox One this month. The latest game to be added is Final Fantasy IX, which is live now for Xbox Game Pass subscribers on Xbox One and PC.\n
    Final Fantasy IX originally released on the PlayStation in 2000 and has sold over five million copies since release. In 2018 many Final Fantasy titles were added to the Nintendo Switch Eshop, including Final Fantasy IX which was delayed until the start of 2019. Final Fantasy VII, Final Fantasy X, Final Fantasy X-2, and Final Fantasy XII: The Zodiac Age were also delayed on the Switch.\n
    The next game to be released on the Xbox Game Pass is Fractured Minds on May 19. Fracture Minds is a first person adventure game which explores the issues of anxiety and mental health. For a full look at what's coming to Xbox Game Pass this month, check out our article here.\n
    Xbox Game Pass gives subscribers access to a huge library of games on Xbox One or PC for $10 a month. A Game Pass Ultimate Subscription allows access to both the PC and Xbox One game libraries, along with an Xbox Live Gold subscription for online play, for $15 a month.",
    view:2,
    comment:0,
    user_id:2
)

#usa, 2020. Support Of Ruby 2.4 Has Ended. [online] Ruby-lang.org. Available at: <https://www.ruby-lang.org/en/news/2020/04/05/support-of-ruby-2-4-has-ended/> [Accessed 15 May 2020].
Post.create!(
    title:"Support of Ruby 2.4 has ended",
    topic:"Ruby",
    text:"We announce that all support of the Ruby 2.4 series has ended.\n
    From the end of March of the last year, the support of the Ruby 2.4 series was in the security maintenance phase. Now, after one year has passed, this phase has ended. Therefore, at March 31, 2020, all support of the Ruby 2.4 series has ended. Bug and security fixes from more recent Ruby versions will no longer be backported to 2.4, and no further patch release of 2.4 will be released. We released Ruby 2.4.10 at March 31, 2020, but it was to give users a little time to move to newer versions. We highly recommend that you upgrade to newer versions of Ruby as soon as possible.",
    view:1,
    comment:0,
    user_id:5
)