# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Account.delete_all
Neighborhood.delete_all
Post.delete_all
Category.delete_all
Alert.delete_all
Admin.delete_all
Agency.delete_all
Business.delete_all
Broadcast.delete_all
Advertisement.delete_all
Group.delete_all
Event.delete_all
TempUser.delete_all
TempNeighborhood.delete_all
TempBusiness.delete_all
TempAgency.delete_all
Request.delete_all

admin = Admin.create(:name => "admin")
admin.build_account(:email => "admin@gmail.com", :password => "password", :password_confirmation => "password")
admin.save

kanto = Neighborhood.create(:name => "Kanto", :address => '11-1 Hokotate-cho, Kamitoba, Minami-ku, Kyoto, Japan')
#wwf = Neighborhood.create(:name => "World Wrestling Federation", :address => '1241 East Main Street Stamford, CT')
wwf = Neighborhood.create(:name => "World Wrestling Federation", :address => '1500 N Patterson St Valdosta, GA')
bikini_bottom = Neighborhood.create(:name => "Bikini Bottom", :address => '300 Rodgers Blvd Honolulu, HI')
#bikini_mexico = Neighborhood.create(:name => "Badsfa", :address => '300 Rsdfaers Blvd Honolulu, HI')

dwayne = User.create(:name => "Dwayne Johnson", :neighborhood_id => wwf.id, :points => 98, :image_url => open('app/assets/images/rock.jpg'), :address => "601 River St, Valdosta, GA 31601")
dwayne.build_account(:email => "djohnson@gmail.com", :password => 'password', :password_confirmation=> 'password')
dwayne.save

daniel = User.create(:name => "Daniel Bryant", :neighborhood_id => wwf.id, :points => 12, :image_url => open('app/assets/images/daniel.jpg'), :address => "505 N Toombs St, Valdosta, GA 31601")
daniel.build_account(:email => "dbryant@gmail.com", :password => 'password', :password_confirmation=> 'password')
daniel.save

hunter = User.create(:name => "Hunter Helmsley", :neighborhood_id => wwf.id, :role => 2, :points => 150, :image_url => open('app/assets/images/helm.jpg'), :address => "400 E Jane St, Valdosta, GA 31601")
hunter.build_account(:email => "hhh@gmail.com", :password => 'password', :password_confirmation=> 'password')
hunter.save

shawn = User.create(:name => "Shawn Michaels", :neighborhood_id => wwf.id, :points => 30, :image_url => open('app/assets/images/shawn.jpg'), :address => "1501 Williams St, Valdosta, GA 31602")
shawn.build_account(:email => "smichaels@gmail.com", :password => 'password', :password_confirmation=> 'password')
shawn.save

mrt = User.create(:name => "Mr. T", :neighborhood_id => wwf.id, :points => 22, :image_url => open('app/assets/images/mrt.jpg'), :address => "104 E Brookwood Pl, Valdosta, GA 31602")
mrt.build_account(:email => "mrt@gmail.com", :password => 'password', :password_confirmation=> 'password')
mrt.save

andre = User.create(:name => "Andre the Giant", :neighborhood_id => wwf.id, :points => 44, :image_url => open('app/assets/images/andre.jpg'), :address => "1618 Beauford Pl, Valdosta, GA 31602")
andre.build_account(:email => "andre@gmail.com", :password => 'password', :password_confirmation=> 'password')
andre.save

goldberg = User.create(:name => "Goldberg", :neighborhood_id => wwf.id, :points => 68, :image_url => open('app/assets/images/goldberg.jpg'), :address => "802 Cherokee Ave, Valdosta, GA 31602")
goldberg.build_account(:email => "goldberg@gmail.com", :password => 'password', :password_confirmation=> 'password')
goldberg.save

hulk = User.create(:name => "Hulk Hogan", :neighborhood_id => wwf.id, :points => 78, :image_url => open('app/assets/images/hulk.jpg'), :address => "809 W Park Ave, Valdosta, GA 31602")
hulk.build_account(:email => "hhogan@gmail.com", :password => 'password', :password_confirmation=> 'password')
hulk.save

flair = User.create(:name => "Ric Flair", :neighborhood_id => wwf.id, :points => 62, :image_url => open('app/assets/images/flair.jpg'), :address => "2106 Azalea Dr, Valdosta, GA 31602")
flair.build_account(:email => "rflair@gmail.com", :password => 'password', :password_confirmation=> 'password')
flair.save

austin = User.create(:name => "Steve Austin", :neighborhood_id => wwf.id, :points => 99, :image_url => open('app/assets/images/austin.jpg'), :address => "901 Pineridge Dr, Valdosta, GA 31602")
austin.build_account(:email => "saustin@gmail.com", :password => 'password', :password_confirmation=> 'password')
austin.save

undertaker = User.create(:name => "The Undertaker", :neighborhood_id => wwf.id, :points => 32, :image_url => open('app/assets/images/undertaker.jpg'), :address => "1401 Iola Dr, Valdosta, GA 31602")
undertaker.build_account(:email => "undertaker@gmail.com", :password => 'password', :password_confirmation=> 'password')
undertaker.save

#ash = User.create(:email => "aketchum@gmail.com", :name => "Ash Ketchum",  :password => 'password', :password_confirmation=> 'password', :neighborhood_id => kanto.id)
#misty = User.create(:email => "misty@gmail.com", :name => "Misty",  :password => 'password', :password_confirmation=> 'password', :neighborhood_id => kanto.id)
#brock = User.create(:email => "brock@gmail.com", :name => "Brock",  :password => 'password', :password_confirmation=> 'password', :neighborhood_id => kanto.id)
#oak = User.create(:email => "poak@gmail.com", :name => "Professor Oak",  :password => 'password', :password_confirmation=> 'password', :neighborhood_id => kanto.id)
#gary = User.create(:email => "goak@gmail.com", :name => "Gary Oak", :password => 'password', :password_confirmation=> 'password', :neighborhood_id => kanto.id)
#
#
#spongebob = User.create(:email => "ssquarepants@gmail.com", :name => "Spongebob Squarepants",  :password => 'password', :password_confirmation=> 'password', :neighborhood_id => bikini_bottom.id)
#patrick = User.create(:email => "pstar@gmail.com", :name => "Patrick Star",  :password => 'password', :password_confirmation=> 'password', :neighborhood_id => bikini_bottom.id)
#squidward = User.create(:email => "stentacles@gmail.com", :name => "Squidward Tentacles",  :password => 'password', :password_confirmation=> 'password', :neighborhood_id => bikini_bottom.id)
#krabs = User.create(:email => "mkrabs@gmail.com", :name => "Mister Krabs",  :password => 'password', :password_confirmation=> 'password', :neighborhood_id => bikini_bottom.id)
#sandy = User.create(:email => "scheeks@gmail.com", :name => "Sandy Cheeks",  :password => 'password', :password_confirmation=> 'password', :neighborhood_id => bikini_bottom.id)
#
lost = Category.create(:title => "Lost Pet")
misc = Category.create(:title => "Miscellaneous")
item = Category.create(:title => "Item for Sale")
job = Category.create(:title => "Job Posting")

Post.create(:category_id => misc.id,
            :body => "WOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO",
            :user_id => flair.id)

Post.create(:category_id => lost.id,
            :body => "I have found someone's cat. He is black with white spots, and is very friendly. Call me at 404-555-2536 for more info.",
            :user_id => goldberg.id,
            :image_url => open('app/assets/images/tuxedo.jpg'))

Post.create(:category_id => job.id,
            :body => "I am looking for someone to repair my broken chair. If you can help or know someone who can, contact me immediately.",
            :user_id => andre.id)

Post.create(:category_id => job.id,
            :body => "I am looking for part-time emplyment while I am between careers. Direct message me if you have any opportunities.",
            :user_id => hulk.id)

Post.create(:category_id => item.id,
            :body => "Casket for sale.",
            :user_id => undertaker.id,
            :image_url => open('app/assets/images/casket.jpg'))

Post.create(:category_id => item.id,
            :body => "Gold chains for sale. One for $100 and two for $150. I pity the fool who doesn't appreciate these savings.",
            :user_id => mrt.id,
            :image_url => open('app/assets/images/chains.jpg'))

Post.create(:category_id => lost.id,
            :body => "My labradoodle Rover has been missing for three days. I am lost without his touch. Please help.",
            :user_id => shawn.id,
            :image_url => open('app/assets/images/labradoodle.jpg'))

Post.create(:category_id => misc.id,
            :body => "The Rock is overrated.",
            :user_id => daniel.id)

Post.create(:category_id => item.id,
            :body => "Gently used championship belt.",
            :user_id => hunter.id,
            :image_url => open('app/assets/images/belt.jpg'))

#Post.create(:category_id => lost.id, :body => "Missing Butterfree. He responds to the name Dave. You can find me in a tent by the river if you find him.", :user_id => brock.id)
#Post.create(:category_id => item.id, :body => "Selling a gold nugget. $5000 OBO; no trades.", :user_id => misty.id)
#Post.create(:category_id => misc.id, :body => "I just beat the Elite Four! I'm the very best.", :user_id => ash.id)
#Post.create(:category_id => job.id, :body => "Looking for a young apprentice to follow in my footsteps through my scientific endeavors. \nQualifications:\n\nMust love animals\nPreferably male\nYoung at heart\nLittle to no parental supervision\n\n Apply at the Oak Laboratory.", :user_id => oak.id)
#Post.create(:category_id => misc.id, :body => "Is anyone looking to trade a Spearow for my Farfetch'd named DUX? I named him when I was 7 years old and now he hates me. Please respond quickly.", :user_id => misty.id)
#Post.create(:category_id => lost.id, :body => "Where is my grandson? Are you my grandson?", :user_id => oak.id)
#Post.create(:category_id => lost.id, :body => "Where is my grandpa? Did he get lost again? He needs his medicine.", :user_id => gary.id)
#Post.create(:category_id => misc.id, :body => "Smell ya later Ash!", :user_id => gary.id)
#Post.create(:category_id => job.id, :body => "I need some cheerleaders to follow me around while I train to be the best!", :user_id => gary.id)
#Post.create(:category_id => misc.id, :body => "Ash is a loser!!!", :user_id => gary.id)
#Post.create(:category_id => misc.id, :body => "I earned so many badges already I'm takin' a break to work on my tan!", :user_id => gary.id)
#Post.create(:category_id => misc.id, :body => "I'm here to battle, not to talk. What about you?", :user_id => gary.id)
#Post.create(:category_id => misc.id, :body => "Well, Ash, ya snooze ya lose, and you're behind right from the start!", :user_id => gary.id)
#
#Post.create(:category_id => misc.id, :body => "How does this work? Patrick are you there?", :user_id => spongebob.id)
#Post.create(:category_id => misc.id, :body => "I'm here Spongebob! This is great!", :user_id => patrick.id)
#Post.create(:category_id => lost.id, :body => "Has anyone seen Wormy? I've looked all over for him and he hasn't turned up.", :user_id => sandy.id)
#Post.create(:category_id => job.id, :body => "Looking for a new line cook to join the Krusty Krab! Payment will be discussed on acceptance.", :user_id => krabs.id)
#Post.create(:category_id => item.id, :body => "Selling a lightly used clarinet. Serious replies only.", :user_id => squidward.id)


bk = Business.create(:name => "Burger King", :address => "1801 N Ashley Street Valdosta, GA", :image_url => open('app/assets/images/king.png'))
bk.build_account(:email => "bk@gmail.com", :password => 'password', :password_confirmation=> 'password')
bk.save

Advertisement.create(:body => "Come try our juicy burgers", :business_id => bk.id, :image_url => open('app/assets/images/whopper.png'))
Advertisement.create(:body => "We have a new strawberry milkshake. Prepare yourself.", :business_id => bk.id)

police = Agency.create(:name => "The Police Dept.",  :address => "500 N Toombs St Valdosta, GA", :image_url => open('app/assets/images/police.png'))
police.build_account(:email => "popo@gmail.com", :password => "password", :password_confirmation => "password")
police.save

police.alerts.create(:body => "Bad guy on the loose!", :severity => 10)
police.alerts.create(:body => "We got that bad guy!", :severity => 1)
police.alerts.create(:body => "Don't do school, stay in drugs.", :severity => 100)

fire = Agency.create(:name => "Fire dept.", :address => "106 S Oak St Valdosta, GA")
fire.build_account(:email => "fire@gmail.com", :password => "password", :password_confirmation => "password")
fire.save

fire.alerts.create(:body => "There is a big fire!", :severity => 100)
fire.alerts.create(:body => "We got that fire.", :severity => 10)
fire.alerts.create(:body => "Cats are in trees.", :severity => 1000)

Alert.create(:body => "Alert 1", :severity => 1)
Alert.create(:body => "Alert 2", :severity => 1)
Alert.create(:body => "Alert 3", :severity => 1)
Alert.create(:body => "Alert 9", :severity => 1)

Broadcast.create(:body => "Broadcast 1")
Broadcast.create(:body => "Broadcast 2")
Broadcast.create(:body => "Broadcast 3")
Broadcast.create(:body => "Broadcast 4")
Broadcast.create(:body => "Broadcast 5")
Broadcast.create(:body => "Broadcast 6")
Broadcast.create(:body => "Broadcast 7")
Broadcast.create(:body => "Broadcast 8")

Event.create(:name => "Pool Party", :body => "Suntan lotion will be provided", :start_time => Time.now, :end_time => Time.now + 2.days, :neighborhood_id => wwf.id, :user_id => daniel.id, :address => '703 W Cranford Ave, Valdosta, GA 31602', :image_url => open('app/assets/images/pool_party.jpg'))
Event.create(:name => "BBQ", :body => "Bring your own beef", :start_time => Time.now + 3.days, :end_time => Time.now + 3.days, :neighborhood_id => wwf.id, :user_id => dwayne.id, :address => '200 High St, Valdosta, GA 31602', :image_url => open('app/assets/images/bbq.jpg'))
Event.create(:name => "Salsa Dancing Lessons", :body => "Learn to dance at Maggie's house this week", :start_time => Time.now - 6.days, :end_time => Time.now - 6.days, :neighborhood_id => wwf.id, :user_id => hunter.id, :address => '107 W Moore St, Valdosta, GA 31602', :image_url => open('app/assets/images/salsa.jpg'))
Event.create(:name => "Block Party", :body => "Fireworks and music for the whole neighborhood", :start_time => Time.now - 16.days, :end_time => Time.now - 16.days, :neighborhood_id => wwf.id, :user_id => hunter.id, :address => '116 E Moore St, Valdosta, GA 31602', :image_url => open('app/assets/images/block.png'))
Event.create(:name => "Battle of the Bands", :body => "Come support your local artists", :start_time => Time.now + 12.days, :end_time => Time.now + 12.days, :neighborhood_id => wwf.id, :user_id => daniel.id, :address => '1609 Slater St, Valdosta, GA 31602', :image_url => open('app/assets/images/bands.png'))
