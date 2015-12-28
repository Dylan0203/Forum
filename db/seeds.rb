# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Category.delete_all
User.delete_all

Category.create!( :name => "Java")
Category.create!( :name => "JavaScrpit")
Category.create!( :name => "Perl")
Category.create!( :name => "C#")
Category.create!( :name => "C++")

User.create!(:email => "dylanmail0203@gmail.com", :first_name => "Dylan", :last_name => "Lin", :password => "12345678", :role => "admin")