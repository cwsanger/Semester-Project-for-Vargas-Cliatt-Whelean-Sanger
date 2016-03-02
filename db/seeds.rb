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

User.create(:email => "djohnson@gmail.com", :name => "Dwayne Johnson",  :password => 'password', :password_confirmation=> 'password')
User.create(:email => "blesnar@gmail.com", :name => "Brock Lesnar",  :password => 'password', :password_confirmation=> 'password')
User.create(:email => "hhh@gmail.com", :name => "Hunter Helmsley",  :password => 'password', :password_confirmation=> 'password')
User.create(:email => "smichaels@gmail.com", :name => "Shawn Michaels",  :password => 'password', :password_confirmation=> 'password')

Neighborhood.create(:name => "World Wrestling Federation")

#lost = Category.create(:title => "Lost Pet")
#misc = Category.create(:title => "Miscellaneous")
#item = Category.create(:title => "Item for Sale")
#job = Category.create(:title => "Job Posting")

#Post.create(:category => lost, :body => "My labradoodle Rover has been missing for three days. I am lost without his touch. Please help.")
#Post.create(:category => misc, :body => "The Rock is overrated.")
#Post.create(:category => item, :body => "Gently used championship belt.")
