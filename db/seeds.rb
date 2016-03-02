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

wwf = Neighborhood.create(:name => "World Wrestling Federation")

dwayne = User.create(:email => "djohnson@gmail.com", :name => "Dwayne Johnson",  :password => 'password', :password_confirmation=> 'password', :neighborhood_id => wwf.id)
brock = User.create(:email => "blesnar@gmail.com", :name => "Brock Lesnar",  :password => 'password', :password_confirmation=> 'password', :neighborhood_id => wwf.id)
hunter = User.create(:email => "hhh@gmail.com", :name => "Hunter Helmsley",  :password => 'password', :password_confirmation=> 'password', :neighborhood_id => wwf.id)
shawn = User.create(:email => "smichaels@gmail.com", :name => "Shawn Michaels",  :password => 'password', :password_confirmation=> 'password', :neighborhood_id => wwf.id)

lost = Category.create(:title => "Lost Pet")
misc = Category.create(:title => "Miscellaneous")
item = Category.create(:title => "Item for Sale")
job = Category.create(:title => "Job Posting")

Post.create(:category_id => lost.id, :body => "My labradoodle Rover has been missing for three days. I am lost without his touch. Please help.", :user_id => shawn.id)
Post.create(:category_id => misc.id, :body => "The Rock is overrated.", :user_id => brock.id)
Post.create(:category_id => item.id, :body => "Gently used championship belt.", :user_id => hunter.id)
