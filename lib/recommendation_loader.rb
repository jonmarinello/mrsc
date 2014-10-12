class RecommendationsLoader
  def self.load_recommendations
    Recommendation.create!(:name => 'shawn_duex',
                           :title => 'Shawn Duex – Engineering Manager at RightScale, October 23, 2013',
                           :body => '"Jon and I have been working together on and off since 2008. We worked together at Microsoft and most recently we have been working closely at Rightscale. Jon is responsible for the development and support of our automated test frameworks. These frameworks included the virtual monkey and rocket monkey testing tools used by my team to validate RightScale''s Windows RightImages and ServerTemplates.
                                      Jon has consistently provided amazing support for my team. He has championed many important features my team has needed and he builds these new features with an extremely high level of quality. Jon is very quick to deliver and does an amazing job following up with my team to ensure that these new features are successfully integrated. If we encounter an issue, Jon is always readily available to suggest a work-around and get a fix developed quickly.
                                      Many of my team members are offshore and Jon has always made him self available during their work day to help with issues or troubleshooting problems. Often times Jon will go the extra mile and proactively check in with my team members and make sure they are unblocked and working efficiently with the tools he supports."',
                           :image_url => 'https://media.licdn.com/mpr/mpr/shrink_200_200/p/3/000/019/0dc/13bcc09.jpg')

    Recommendation.create!(:name => 'kannan_manickam',
                           :title => 'Kannan Manickam - Senior Software Engineer at RightScale, April 8, 2013',
                           :body => '"Jon is an one-man-army in developing and maintaining code for the testing framework used here at RightScale to test the server configuration across different cloud vendors and operating systems using the API. He always has the passion for learning new tools, technologies, and integrating it with the product he builds.
                                      Whether it is day or night, He is available to support teams related to issues they have with the product he built and fixes them ASAP. Jon''s tireless work ethic and positive attitude make him a valuable professional. I would recommend Jon without hesitation."',
                           :image_url => 'https://media.licdn.com/media/p/1/005/020/215/2f128be.jpg')

    Recommendation.create!(:name => 'nitin_mohan',
                           :title => 'Nitin Mohan - Senior Software Engineer at RightScale, April 6, 2013',
                           :body => '"Its been a delight to work along-side Jon. He has solid skills in design and finishing projects within deadline.
                                      He has been instrumental in automating our testing across different cloud providers and refactoring test code in ruby to make it easier to understand and use. He is very approachable and friendly, and never hesitates to share his wisdom."',
                           :image_url => 'https://media.licdn.com/media/p/3/000/0a2/3e2/10b5d3a.jpg')

    Recommendation.create!(:name => 'cary_penniman',
                           :title => 'Cary Penniman - Software Architect at RightScale, April 5, 2013',
                           :body => '"Jon has rock solid software engineering skills and has done a great job maintaining and refactoring our Ruby-based test framework which tests server configurations in the cloud. He is an asset to any company."',
                           :image_url => 'https://media.licdn.com/mpr/mpr/shrink_200_200/p/2/000/027/00b/13c7ad4.jpg')

    Recommendation.create!(:name => 'dan_onorato',
                           :title => 'Dan Onorato - Quality Assurance Manager, RightScale April 24, 2012',
                           :body => '"RightScale contracted with Jon Marinello at Mission Ridge Software Consulting in February of 2012 to back-fill the departure of our lead developer who was responsible for a very complex automated test framework designed to verify cloud-based server implementations. Jon faced a significant learning curve at the onset of this project.
                                      He came up to speed very quickly on an array new technologies; Ruby, Bash, Linux, Cloud Infrastructure and all our internal applications. In addition to the programming tasks, Jon has also stepped up and managed all the Test Automation Agile SDLC (Scrum) story grooming, sprint planning, estimation and sprint execution.
                                      Jon’s focus on teamwork, professionalism and after-hours availability have had a significant impact on our success. Simply stated, Jon has done an outstanding job and has exceeded all my expectations. If you’re looking for software consulting services that you can rely on to solve tough problems, I highly recommend Jon Marinello and Mission Ridge Software Consulting."',
                           :image_url => 'https://media.licdn.com/media/p/6/005/036/28b/09ddbb5.jpg')

    Recommendation.create!(:name => 'efrain_olivares',
                           :title => 'Efrain Olivares - Software Development Engineer in Test, RightScale April 16, 2012',
                           :body => '"I\'ve had the pleasure of working with Jon on an a very fast moving and quick to yield results test automation project. I had been thinking about this project for a while, so I was pleasantly surprised when Jon not only quickly picked up the vision of the project but implemented features ahead of schedule which added value on a timescale I hadn\'t foreseen. During planning, he helped guide our discussions down to just the necessary details to minimize risk, yet not constrain us or over think a solution.
                                      In short, Jon has the ability to bring true and tried Software Engineering experience to the table, while at the same time keeping an open mind to new possibilities and solutions then following that up with very pragmatic engineering skills in execution."',
                           :image_url => 'https://media.licdn.com/media/p/4/000/156/0a1/32effd9.jpg')

    Recommendation.create!(:name => 'vitaly_sedelnik',
                           :title => 'Vitaly Sedelnik – Cloud Solutions Engineer / Team Lead, RightScale August 16, 2014',
                           :body => '"Jon is super skilled software engineer, equally great at design, implementation, troubleshooting and maintenance. We worked together for about 2 years at RightScale collaborating on internal test automation framework which was developed and maintained by him. Jon consistently provided high quality and feature rich automation tools which bring QA in my team to the next level. Besides his professionalism Jon is just a nice person, open minded and pleasure to work with. I am looking forward to work with Jon in the future."',
                           :image_url => 'https://media.licdn.com/media/p/8/005/07c/212/17956c3.jpg')

    Recommendation.create!(:name => 'pavel_seredenko',
                           :title => 'Pavel Seredenko - QA Engineer at Rightscale, August 14, 2014',
                           :body => '"At the time I worked with Jon he was a senior developer of a test framework for cloud computing testing.
                                      It was a pleasure to work with Jon, in both professional and personal area. Jon is a real Ruby and cloud computing professional, with a deep understanding of steps, which should be done to achieve project goals, and a deep understanding how this goals can be achieved.
                                      Jon\'s main edges is a solid understanding of a problem and a that he is always doing he\'s best to solve a problem. It was a great experience for me to work with Jon"',
                           :image_url => 'https://media.licdn.com/media/p/6/005/080/368/2b45280.jpg')

    Recommendation.create!(:name => 'steve_reynolds',
                           :title => 'Steve Reynolds – Managing Partner, Elite Associates 2011',
                           :body => '"We contracted with Mission Ridge Software Consulting LLC to help us in a couple of key areas; Test automation and choosing a new SDLC process. Mission Ridge Software Consulting LLC was instrumental in providing the training we needed in these key areas. Test Driven Development (TDD) was an area new to us and they walked us through the process, helped us select a test framework and mentored us on an ongoing basis.
                                      Choosing a new SDLC process was something we always wanted to do but just kept putting off. We had been using a form of the Waterfall process but we needed to be much more responsive to our customers. Mission Ridge Software Consulting LLC helped us understand the Scrum approach and how it could be effectively applied in our company. Mission Ridge Software Consulting LLC provided the training, real-world examples and implementation road-map we needed to successfully make the transition to Scrum.
                                      The result of this investment is that we have really improved our overall engineering excellence, have a happier and much more productive team and, most importantly, we have much happier customers. This has had a significant positive impact on our bottom line. Mission Ridge Software Consulting LLC gets our highest recommendation!"',
                           :image_url => 'https://media.licdn.com/media/p/3/000/00c/3ee/2ca21ff.jpg')
  end
end
