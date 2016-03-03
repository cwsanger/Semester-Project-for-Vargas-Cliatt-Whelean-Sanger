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


kanto = Neighborhood.create(:name => "Kanto", :address => '11-1 Hokotate-cho, Kamitoba, Minami-ku, Kyoto, Japan')
wwf = Neighborhood.create(:name => "World Wrestling Federation", :address => '1241 East Main Street Stamford, CT')
bikini_bottom = Neighborhood.create(:name => "Bikini Bottom", :address => '300 Rodgers Blvd Honolulu, HI')

dwayne = User.create(:email => "djohnson@gmail.com", :name => "Dwayne Johnson",  :password => 'password', :password_confirmation=> 'password', :neighborhood_id => wwf.id)
daniel = User.create(:email => "dbryant@gmail.com", :name => "Daniel Bryant",  :password => 'password', :password_confirmation=> 'password', :neighborhood_id => wwf.id)
hunter = User.create(:email => "hhh@gmail.com", :name => "Hunter Helmsley",  :password => 'password', :password_confirmation=> 'password', :neighborhood_id => wwf.id)
shawn = User.create(:email => "smichaels@gmail.com", :name => "Shawn Michaels",  :password => 'password', :password_confirmation=> 'password', :neighborhood_id => wwf.id)

ash = User.create(:email => "aketchum@gmail.com", :name => "Ash Ketchum",  :password => 'password', :password_confirmation=> 'password', :neighborhood_id => kanto.id)
misty = User.create(:email => "misty@gmail.com", :name => "Misty",  :password => 'password', :password_confirmation=> 'password', :neighborhood_id => kanto.id)
brock = User.create(:email => "brock@gmail.com", :name => "Brock",  :password => 'password', :password_confirmation=> 'password', :neighborhood_id => kanto.id)
oak = User.create(:email => "poak@gmail.com", :name => "Professor Oak",  :password => 'password', :password_confirmation=> 'password', :neighborhood_id => kanto.id)


spongebob = User.create(:email => "ssquarepants@gmail.com", :name => "Spongebob Squarepants",  :password => 'password', :password_confirmation=> 'password', :neighborhood_id => bikini_bottom.id)
patrick = User.create(:email => "pstar@gmail.com", :name => "Patrick Star",  :password => 'password', :password_confirmation=> 'password', :neighborhood_id => bikini_bottom.id)
squidward = User.create(:email => "stentacles@gmail.com", :name => "Squidward Tentacles",  :password => 'password', :password_confirmation=> 'password', :neighborhood_id => bikini_bottom.id)
krabs = User.create(:email => "mkrabs@gmail.com", :name => "Mister Krabs",  :password => 'password', :password_confirmation=> 'password', :neighborhood_id => bikini_bottom.id)
sandy = User.create(:email => "scheeks@gmail.com", :name => "Sandy Cheeks",  :password => 'password', :password_confirmation=> 'password', :neighborhood_id => bikini_bottom.id)

lost = Category.create(:title => "Lost Pet")
misc = Category.create(:title => "Miscellaneous")
item = Category.create(:title => "Item for Sale")
job = Category.create(:title => "Job Posting")

Post.create(:category_id => lost.id, :body => "My labradoodle Rover has been missing for three days. I am lost without his touch. Please help.", :user_id => shawn.id)
Post.create(:category_id => misc.id, :body => "The Rock is overrated.", :user_id => daniel.id)
Post.create(:category_id => item.id, :body => "Gently used championship belt.", :user_id => hunter.id)

Post.create(:category_id => lost.id, :body => "Missing Butterfree. He responds to the name Dave. You can find me in a tent by the river if you find him.", :user_id => brock.id)
Post.create(:category_id => item.id, :body => "Selling a gold nugget. $5000 OBO; no trades.", :user_id => misty.id)
Post.create(:category_id => misc.id, :body => "I just beat the Elite Four! I'm the very best.", :user_id => ash.id)
Post.create(:category_id => job.id, :body => "Looking for a young apprentice to follow in my footsteps through my scientific endeavors. \nQualifications:\n\nMust love animals\nPreferably male\nYoung at heart\nLittle to no parental supervision\n\n Apply at the Oak Laboratory.", :user_id => oak.id)
Post.create(:category_id => misc.id, :body => "Is anyone looking to trade a Spearow for my Farfetch'd named DUX? I named him when I was 7 years old and now he hates me. Please respond quickly.", :user_id => misty.id)
Post.create(:category_id => lost.id, :body => "Where is my grandson? Are you my grandson?", :user_id => oak.id)

Post.create(:category_id => misc.id, :body => "How does this work? Patrick are you there?", :user_id => spongebob.id)
Post.create(:category_id => misc.id, :body => "I'm here Spongebob! This is great!", :user_id => patrick.id)
Post.create(:category_id => lost.id, :body => "Has anyone seen Wormy? I've looked all over for him and he hasn't turned up.", :user_id => sandy.id)
Post.create(:category_id => job.id, :body => "Looking for a new line cook to join the Krusty Krab! Payment will be discussed on acceptance.", :user_id => krabs.id)
Post.create(:category_id => item.id, :body => "Selling a lightly used clarinet. Serious replies only.", :user_id => squidward.id)
