# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Neighborhood.delete_all
Post.delete_all
Category.delete_all
Alert.delete_all
Broadcast.delete_all
Advertisement.delete_all


kanto = Neighborhood.create(:name => "Kanto", :address => '11-1 Hokotate-cho, Kamitoba, Minami-ku, Kyoto, Japan')
wwf = Neighborhood.create(:name => "World Wrestling Federation", :address => '1241 East Main Street Stamford, CT')
bikini_bottom = Neighborhood.create(:name => "Bikini Bottom", :address => '300 Rodgers Blvd Honolulu, HI')
bikini_mexico = Neighborhood.create(:name => "Badsfa", :address => '300 Rsdfaers Blvd Honolulu, HI')

dwayne = User.create(:name => "Dwayne Johnson", :neighborhood_id => wwf.id)
dwayne.build_account(:email => "djohnson@gmail.com", :password => 'password', :password_confirmation=> 'password')
dwayne.save
daniel = User.create(:name => "Daniel Bryant", :neighborhood_id => wwf.id)
daniel.build_account(:email => "dbryant@gmail.com", :password => 'password', :password_confirmation=> 'password')
daniel.save
hunter = User.create(:name => "Hunter Helmsley", :neighborhood_id => wwf.id)
hunter.build_account(:email => "hhh@gmail.com", :password => 'password', :password_confirmation=> 'password')
hunter.save
shawn = User.create(:name => "Shawn Michaels", :neighborhood_id => wwf.id)
shawn.build_account(:email => "smichaels@gmail.com", :password => 'password', :password_confirmation=> 'password')
shawn.save

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

Post.create(:category_id => lost.id, :body => "My labradoodle Rover has been missing for three days. I am lost without his touch. Please help.", :user_id => shawn.id)
Post.create(:category_id => misc.id, :body => "The Rock is overrated.", :user_id => daniel.id)
Post.create(:category_id => item.id, :body => "Gently used championship belt.", :user_id => hunter.id)

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


bk = Business.create(:name => "Burger King")
bk.build_account(:email => "bk@gmail.com", :password => 'password', :password_confirmation=> 'password')
bk.save

bk.neighborhoods << wwf

Advertisement.create(:body => "Come try our juicy burgers", :business_id => bk.id)
Advertisement.create(:body => "We have a new strawberry milkshake. Prepare yourself.", :business_id => bk.id)
